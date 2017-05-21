class Rescrape::Controller
  SEARCHES = [
    # {:city => "atlanta", :state => "ga", :keywords => ["javascript"]},
    # {:city => "atlanta", :state => "ga", :keywords => ["ruby"]},
    # {:city => "atlanta", :state => "ga", :keywords => ["javascript, ruby, rails, react, node"]},
    # {:city => "atlanta", :state => "ga", :keywords => ["business", "analyst", "javascript", "ruby"]},
    # {:city => "atlanta", :state => "ga", :keywords => ["project", "manager", "javascript", "ruby"]},
    # {:city => "atlanta", :state => "ga", :keywords => ["project", "coordinator", "javascript", "ruby"]},
    # {:city => "atlanta", :state => "ga", :keywords => ["javascript", "react"]},
    # {:city => "atlanta", :state => "ga", :keywords => ["node"]},
    # {:city => "atlanta", :state => "ga", :keywords => ["junior", "developer"]},
    # {:city => "atlanta", :state => "ga", :keywords => ["internship", "javascript", "ruby"]},
    # {:city => "atlanta", :state => "ga", :keywords => ["apprenticeship", "javascript", "ruby"]},
    #
    # {:city => "Duluth", :state => "ga", :keywords => ["javascript"]},
    {:city => "Duluth", :state => "ga", :keywords => ["ruby"]}#,
    # {:city => "Duluth", :state => "ga", :keywords => ["javascript, ruby, rails, react, node"]},
    # {:city => "Duluth", :state => "ga", :keywords => ["business", "analyst", "javascript", "ruby"]},
    # {:city => "Duluth", :state => "ga", :keywords => ["project", "manager", "javascript", "ruby"]},
    # {:city => "Duluth", :state => "ga", :keywords => ["project", "coordinator", "javascript", "ruby"]},
    # {:city => "Duluth", :state => "ga", :keywords => ["javascript", "react"]},
    # {:city => "Duluth", :state => "ga", :keywords => ["node"]},
    # {:city => "Duluth", :state => "ga", :keywords => ["junior", "developer"]},
    # {:city => "Duluth", :state => "ga", :keywords => ["internship", "javascript", "ruby"]},
    # {:city => "Duluth", :state => "ga", :keywords => ["apprenticeship", "javascript", "ruby"]}
  ]

  def call
    puts "Welcome to Rescrape".colorize(:light_cyan)
    start_menu
  end

  def start_menu
    puts "Type 'scrape' to get started"
    input = gets.strip.downcase

    if input == "scrape"
      start
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