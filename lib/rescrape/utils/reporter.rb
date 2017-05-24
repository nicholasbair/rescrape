class Rescrape::Reporter
  # IDEA:
  # Show user top 50 closest jobs by:
    # Distance
    # Travel time
    # Travel w/ traffic
    # Allow user to open selection in browser
  # Most common key words

  # Reporter aggregates data and passes to Excel
  # Excel will need to be refactored to be more generic

  def print_jobs

  end

  def get_row_data(job)
    job.attributes.collect { |k,v| v }
  end
end
