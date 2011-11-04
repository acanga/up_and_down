class StockholderBaseReportParser
  @queue = :stockholder_base_report_parser
  
  def self.perform(stockholder_base_report_id)
    stockholder_base_report = StockholderBaseReport.find(stockholder_base_report_id)                
    
    excel_report_file = excel_report_object_for stockholder_base_report
    excel_report_file.default_sheet = excel_report_file.sheets.first
    
    6.upto(excel_report_file.last_row - 1) do |row|
      # stockholder_base_report.stockholders.create_or_update_from_excel_row excel_report_file.row(row)
      Stockholder.create_or_update_from_excel_row excel_report_file.row(row), :uploaded_on => stockholder_base_report
    end

    stockholder_base_report.update_attribute(:parsed, true)
  end
  
  protected
    def self.excel_report_object_for(stockholder_base_report)
      if stockholder_base_report.excel_report.to_s.match /xlsx$/i
        excel_class = Excelx 
      else
        excel_class = Excel
      end

      excel_class.new File.join(Rails.root, "public", stockholder_base_report.excel_report.to_s)
    end
end