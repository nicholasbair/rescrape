class Rescrape::Controller
  def call
    puts "Welcome to Rescrape".colorize(:light_cyan)
    start_menu
  end

  def start_menu
    puts <<-MENU.gsub /^\s+/, ""
      Main menu:
      1 - View current searches
      2 - Add a new search
      3 - Delete a search
    MENU

    input = gets.strip.to_i

    case input
    when 1
      puts <<-SEARCH_MENU.gsub /^\s+/, ""
        Search Menu:
        All - Run all searches
        Back - Back to main menu
        # - Line number to run specific search
        ======================================
      SEARCH_MENU
      print_all_searches
      # Allow user to scrape one
      # Allow user to scrape all
      search_input = gets.strip
      search(search_input)
    when 2
      create_search
      start_menu
    when 3
      puts <<-DELETE_MENU.gsub /^\s+/, ""
      # - Line number to delete a search
      ======================================
      DELETE_MENU
      print_all_searches
      search_input = gets.strip
      Rescrape::Search.find(search_input).destroy
      puts "Successfully deleted search."
      start_menu
    else
      start_menu
    end
  end

  def create_search
    details = {}
    puts "Please enter a city:"
    details[:city] = gets.strip.downcase

    puts "Please enter a state:"
    details[:state] = gets.strip.downcase

    puts "Please enter keywords for job search (separated by comma):"
    details[:keywords] = gets.strip.downcase

    puts "Please select a supported job site:"
    print_all_job_sites
    input = gets.strip.to_i
    all_sites = Rescrape::JobSite.all
    job_site = all_sites[input_to_index(input)]

    search = Rescrape::Search.new(details)
    search.job_site = job_site
    search.save
  end

  def print_all_searches
    Rescrape::Search.all.each.with_index(1) do |s, i|
      puts "#{i}. #{s.job_site.name}: Find #{s.keywords} jobs in #{s.city}, #{s.state}"
    end
  end

  def print_all_job_sites
    Rescrape::JobSite.all.each.with_index(1) do |j, i|
      puts "#{i}. #{j.name}"
    end
  end

  def input_to_index(n)
    n.to_i - 1
  end

  def search(input)
    case input
    when "all"
      Rescrape::Search.all.each.with_index(1) do |s, i|
        # send("Rescrape::Scrape#{s.job_site.name}.new.call(s)")
        Rescrape::ScrapeIndeed.new.call(s)
        puts "Search ##{i} completed."
      end
      start_menu
    when "back"
      start_menu
    when -> (i) { i.to_i > 0 }
      all_searches = Rescrape::Search.all
      Rescrape::ScrapeIndeed.new.call(all_searches[input_to_index(input.to_i)])
      start_menu
    else
      start_menu
    end
  end

  # def start
  #   puts "Scraping...this might take a while."
  #
  #   SEARCHES.each do |s|
  #     Rescrape::ScrapeIndeed.new.call(s)
  #   end
  #
  #   Rescrape::Excel.write
  #   puts "Writing #{Rescrape::Job.all.length} results to file"
  #   puts "Done => #{Rescrape::Excel.config_filename}"
  # end
end
