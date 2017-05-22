class Rescrape::Excel
  def self.write
    p = Axlsx::Package.new
    wb = p.workbook

    wb.add_worksheet(:name => "Jobs") do |sheet|
      styles = wb.styles.add_style :b => true,
        :border => { :style => :thin, :color => "000000", :edges => [:bottom] }
      sheet.add_row ["Company", "Job Title", "City", "State", "Description", "URL"], :style => styles

      Rescrape::Job.all.each do |job|
        sheet.add_row [job.company, job.title, job.city, job.state, job.description, job.url]
      end
    end
    p.serialize self.config_filename
  end

  def self.config_filename
    "#{Dir.home()}/documents/scrape_data/scrape-#{SecureRandom.uuid}.xlsx"
  end
end
