class Rescrape::Reporter
  # In controller, look at instance methods of Reporter
  # use that to create menu

  def all_jobs
    Rescrape::Excel.new.write(Rescrape::Job.all)
  end

  def closest_jobs_by_distance
    Rescrape::Excel.new.write(Rescrape::Job.order(:distance))
  end

  def closest_jobs_by_travel_time
    Rescrape::Excel.new.write(Rescrape::Job.order(:duration))
  end

  def closest_jobs_by_travel_with_traffic
    Rescrape::Excel.new.write(Rescrape::Job.order(:duration_in_traffic))
  end

  def all_companies
    Rescrape::Excel.new.write(Rescrape::Company.all)
  end
end
