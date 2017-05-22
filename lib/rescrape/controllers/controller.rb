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
      # Allow user to create new search
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

  def print_all_searches
    Rescrape::Search.all.each.with_index(1) do |s, i|
      puts "#{i}. #{s.job_site.name}: Find #{s.keywords} jobs in #{s.city}, #{s.state}"
    end
  end

  def input_to_index(n)
    n.to_i - 1
  end

  def search(input)
    case input
    when "all"
      # Iterate over searches and scrape

    when "back"
      start_menu
    # when #
    # Run specific scrape
    else
      start_menu
    end
  end

  def start
    puts "Scraping...this might take a while."

    SEARCHES.each do |s|
      Rescrape::ScrapeIndeed.new.call(s)
    end

    Rescrape::Excel.write
    puts "Writing #{Rescrape::Job.all.length} results to file"
    puts "Done => #{Rescrape::Excel.config_filename}"
  end
end
