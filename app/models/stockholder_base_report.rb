class StockholderBaseReport < ActiveRecord::Base
  mount_uploader :excel_report, ExcelReportUploader

  validates_presence_of :excel_report
end                                                