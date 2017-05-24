class Rescrape::Excel
  def write(data)
    p = Axlsx::Package.new
    wb = p.workbook

    wb.add_worksheet(:name => "Jobs") do |sheet|
      styles = wb.styles.add_style :b => true,
        :border => { :style => :thin, :color => "000000", :edges => [:bottom] }
      sheet.add_row get_column_names(data), :style => styles

      data.each do |d|
        sheet.add_row get_row_data(d)
      end
    end
    p.serialize config_filename
  end

  def config_filename
    "#{Dir.home()}/documents/scrape_data/scrape-#{SecureRandom.uuid}.xlsx"
  end

  private
  def get_column_names(data)
    data.first.attributes.collect { |k,v| k }
  end

  def get_row_data(data_point)
    data_point.attributes.collect { |k,v| v }
  end
end
