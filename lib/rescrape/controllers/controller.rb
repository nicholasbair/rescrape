class Rescrape::Controller
  def call
    puts "Welcome to Rescrape".colorize(:light_cyan)
    config_user unless Rescrape::User.first
    start_menu
  end

  private
  def config_user
    Rescrape::User.destroy_all
    user = Rescrape::User.new
    puts "We will use your home city/state to calculate commute times"
    puts "Please enter your home city"
    user.city = gets.strip
    puts "Please enter your home state"
    user.state = gets.strip

    if user.city && user.state
      coordinates = Rescrape::Placer.new({city: user.city, state: user.state}).geocode
      user.lat = coordinates["lat"]
      user.lng = coordinates["lng"]
      user.save
      start_menu
    else
      config_user
    end
  end

  def start_menu
    puts <<-MENU.gsub /^\s+/, ""
      Main menu:
      1 - View current searches
      2 - Add a new search
      3 - Delete a search
      4 - Report builder
      5 - Update home
    MENU

    input = gets.strip.to_i

    case input
    when 1
      view_current_searches
    when 2
      add_new_search
    when 3
      delete_search
    when 4
      report_menu
    when 5
      config_user
    else
      start_menu
    end
  end

  def view_current_searches
    puts <<-SEARCH_MENU.gsub /^\s+/, ""
      Search Menu:
      All - Run all searches
      Back - Back to main menu
      # - Line number to run specific search
      ======================================
    SEARCH_MENU
    print_all_searches
    if Rescrape::Search.all.size == 0
      puts "Please create a search from main menu"
      start_menu
    end
    search_input = gets.strip
    search(search_input)
  end

  def add_new_search
    create_search
    start_menu
  end

  def delete_search
    puts <<-DELETE_MENU.gsub /^\s+/, ""
    # - Line number to delete a search
    ======================================
    DELETE_MENU
    print_all_searches
    search_input = gets.strip
    Rescrape::Search.all[input_to_index(search_input)].destroy
    puts "Successfully deleted search."
    start_menu
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

  def find_scraper(search)
    case search.job_site.name
    when "Indeed"
      scrape = Rescrape::ScrapeIndeed.new
      scrape.call(search)
      scrape.status_update
    end
  end

  def search(input)
    case input
    when "all"
      Rescrape::Search.all.each.with_index(1) do |s, i|
        find_scraper(s)
        puts "Search ##{i} completed."
      end
      start_menu
    when "back"
      start_menu
    when -> (i) { i.to_i > 0 }
      all_searches = Rescrape::Search.all
      find_scraper(all_searches[input_to_index(input.to_i)])
      start_menu
    else
      start_menu
    end
  end

  def report_menu
    puts <<-MENU.gsub /^\s+/, ""
      Report menu:
      1 - All jobs
      2 - All companies
      3 - Closest jobs by distance
      4 - Closest jobs by travel time
      5 - Closest jobs by travel with traffic
      6 - Back
    MENU

    input = gets.strip.to_i

    report = Rescrape::Reporter.new
    case input
    when 1
      report.new.all_jobs
    when 2
      report.new.all_companies
    when 3
      report.new.closest_jobs_by_distance
    when 4
      report.new.closest_jobs_by_travel_time
    when 5
      report.new.closest_jobs_by_travel_with_traffic
    when 6
      start_menu
    end
    write_excel
  end

  def write_excel
    puts "Writing results to file"
    start_menu
  end
end
