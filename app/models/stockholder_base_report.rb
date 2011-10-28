class StockholderBaseReport < ActiveRecord::Base
  mount_uploader :excel_report, ExcelReportUploader
end                                                