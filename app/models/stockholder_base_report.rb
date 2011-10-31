class StockholderBaseReport < ActiveRecord::Base
  belongs_to :user
  has_many :stockholders
  
  mount_uploader :excel_report, ExcelReportUploader
  
  validates_presence_of :excel_report
  validates_format_of :excel_report, :with => /(\.xls|\.xlsx)$/i, :allow_blank => true

  after_save :parse_excel_report

  protected
    def parse_excel_report
      excel_report_file = excel_report_object
      excel_report_file.default_sheet = excel_report_file.sheets.first

      6.upto(excel_report_file.last.row) do |line|
        Stockholder.create(:name => excel_report_file.cell(line, 1))
      end
    end

    def excel_report_object
      if excel_report.to_s.match /xlsx$/i
        excel_class = Excelx 
      else
        excel_class = Excel
      end
      
      excel_class.new File.join(Rails.root, "public", excel_report.to_s)
    end
end