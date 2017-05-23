class Rescrape::Controller
  def call
    puts "Welcome to Rescrape".colorize(:light_cyan)
    set_home if Rescrape::User.first.nil?
    start_menu
  end

  def set_home
    user = Rescrape::User.new
    puts "We will use your home city/state to calculate commute times"
    puts "Please enter your home city"
    user.city = gets.strip
    puts "Please enter your home state"
    user.state = gets.strip
    user.save
  end

  def start_menu
    puts <<-MENU.gsub /^\s+/, ""
      Main menu:
      1 - View current searches
      2 - Add a new search
      3 - Delete a search
      4 - Write all data to excel
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
      write_excel
    when 5
      update_home
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
    Rescrape::Search.find(search_input).destroy
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
      Rescrape::ScrapeIndeed.new.call(search)
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

  def write_excel
    Rescrape::Excel.write
    puts "Writing #{Rescrape::Job.all.length} results to file"
    puts "Done => #{Rescrape::Excel.config_filename}"
    start_menu
  end

  def update_home
    user = Rescrape::User.first
    puts "Please enter your home city"
    user.city = gets.strip
    puts "Please enter your home state"
    user.state = gets.strip
    user.save
    start_menu
  end
end
