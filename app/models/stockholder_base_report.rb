class StockholderBaseReport < ActiveRecord::Base
  belongs_to :user
  has_many :stockholders
  
  mount_uploader :excel_report, ExcelReportUploader
  
  validates_presence_of :excel_report
  validates_format_of :excel_report, :with => /(\.xls|\.xlsx)$/i, :allow_blank => true

  after_save :parse_excel_report

  protected
    def parse_excel_report
      Resque.enqueue(StockholderBaseReportParser, self.id)
    end
end