class Rescrape::Excel
  def self.write
    p = Axlsx::Package.new
    wb = p.workbook

    wb.add_worksheet(:name => "Jobs") do |sheet|
      styles = wb.styles.add_style :b => true,
        :border => { :style => :thin, :color => "000000", :edges => [:bottom] }
      sheet.add_row get_column_names, :style => styles

      Rescrape::Job.all.each do |job|
        sheet.add_row get_row_data
      end
    end
    p.serialize self.config_filename
  end

  def self.config_filename
    "#{Dir.home()}/documents/scrape_data/scrape-#{SecureRandom.uuid}.xlsx"
  end

  private
  def self.get_column_names
    Rescrape::Job.column_names
  end

  def self.get_row_data(job)
    job.attributes.collect { |k,v| v }
  end
end
