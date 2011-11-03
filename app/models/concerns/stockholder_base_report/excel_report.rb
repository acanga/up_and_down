module StockholderBaseReport::ExcelReport
  extend ActiveSupport::Concern

  included do
    mount_uploader :excel_report, ExcelReportUploader

    validates_presence_of :excel_report
    validates_format_of :excel_report, :with => /(\.xls|\.xlsx)$/i, :allow_blank => true

    after_create :parse_excel_report

    scope :unparsed, where(:parsed => false)
    scope :parsed, where(:parsed => true)
  end
  
  protected
    def parse_excel_report
      Resque.enqueue(StockholderBaseReportParser, self.id)
    end
end