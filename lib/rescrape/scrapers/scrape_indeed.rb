class Rescrape::ScrapeIndeed < Rescrape::Scrape
  attr_accessor :counter

  def initialize
    @page_counter = 1
    @job_counter = 0
  end

  def call(data)
    if @page_counter == 1
      doc = Nokogiri::HTML(open(prep_url(data)))
    else
      doc = Nokogiri::HTML(open("https://www.indeed.com/#{data}"))
    end

    jobs = doc.css("#resultsCol").css(".row")

    jobs.each do |job|
      details = {}

      begin
        title_div = job.css(".jobtitle").css("a")
        url = title_div[0]["href"]
        details[:url] = "https://www.indeed.com#{url}"
      rescue
        details[:url] = nil
      end

      if !Rescrape::Job.find_by(url: details[:url])
        details[:title] = job.css(".jobtitle").text.strip
        details[:description] = job.css(".summary").text.strip

        location = job.css(".location").text.strip.split(", ")
        details[:city] = location[0]
        details[:state] = location[1].split(" ")[0]
        details[:company] = Rescrape::Company.find_or_create_by(name: job.css(".company").text.strip, city: location[0], state: location[1])

        if !details[:company].lat && !details[:company].lng
          begin
            data = Rescrape::Placer.new({name: details[:company].name, city: location[0], state: location[1]}).find_place
            details[:company].lat = data["lat"]
            details[:company].lng = data["lng"]
          rescue
            nil
          end
        end

        if details[:company].lat && details[:company].lng
          begin
            map_data = Rescrape::Mapper.new(details[:company].lat, details[:company].lng).get_distance

            # TODO: return value of get_distance should handle this
            details[:distance] = map_data["distance"]["text"].to_f
            details[:duration] = map_data["duration"]["text"]
            details[:duration_in_traffic] = map_data["duration_in_traffic"]["text"]
          rescue
            nil
          end
        end

        Rescrape::Job.create(details)
        @job_counter +=1
      end
    end

    pages = doc.css(".pagination").css("a")
    next_element = pages.detect { |p| p.css(".pn").text == (@page_counter + 1).to_s }

    if next_element.nil?
      next_page = nil
    else
      next_page = next_element["href"]
    end

    @page_counter += 1
    call(next_page) if !next_page.nil?
  end

  def status_update
    puts "Successfully added #{@job_counter} jobs to the database!"
  end

  private
  def prep_url(data)
    base_url = "https://www.indeed.com/jobs?q="
    keywords = data[:keywords].split(/,\s*| /).join("+")
    location = "&l="
    city = data[:city]
    split = "%2C+"
    state = data[:state]

    query = ""

    if keywords.length > 0
      query = "#{keywords}"
    end

    if !city.nil? && !state.nil?
      query += "#{location}#{city}#{split}#{state}"
    elsif !city.nil? && state.nil?
      query += "#{location}#{city}"
    elsif city.nil? && !state.nil?
      query += "#{location}#{state}"
    else
      query += "#{location}"
    end
    "#{base_url}#{query}"
  end
end
