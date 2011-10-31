class StockholderBaseReport < ActiveRecord::Base
  belongs_to :user
  
  mount_uploader :excel_report, ExcelReportUploader
  
  validates_presence_of :excel_report
  validates_format_of :excel_report, :with => /(\.xls|\.xlsx)$/i, :allow_blank => true
end                                                