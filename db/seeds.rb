search = Rescrape::Search.create(:city => "Duluth", :state => "GA", :keywords => "ruby")
indeed = Rescrape::JobSite.create(:name => "Indeed", :base_url => "http://www.indeed.com")

search.job_site = indeed

# SEARCHES = [
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
  # {:city => "Duluth", :state => "ga", :keywords => ["ruby"]},
  # {:city => "Duluth", :state => "ga", :keywords => ["javascript, ruby, rails, react, node"]},
  # {:city => "Duluth", :state => "ga", :keywords => ["business", "analyst", "javascript", "ruby"]},
  # {:city => "Duluth", :state => "ga", :keywords => ["project", "manager", "javascript", "ruby"]},
  # {:city => "Duluth", :state => "ga", :keywords => ["project", "coordinator", "javascript", "ruby"]},
  # {:city => "Duluth", :state => "ga", :keywords => ["javascript", "react"]},
  # {:city => "Duluth", :state => "ga", :keywords => ["node"]},
  # {:city => "Duluth", :state => "ga", :keywords => ["junior", "developer"]},
  # {:city => "Duluth", :state => "ga", :keywords => ["internship", "javascript", "ruby"]},
  # {:city => "Duluth", :state => "ga", :keywords => ["apprenticeship", "javascript", "ruby"]}
# ]
