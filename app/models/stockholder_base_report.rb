class StockholderBaseReport < ActiveRecord::Base
  mount_uploader :excel_report, ExcelReportUploader

  validates_presence_of :excel_report
  validates_format_of :excel_report, :with => /(\.xls|\.xlsx)$/i, :allow_nil => true
end                                                