class StockholderBaseReport < ActiveRecord::Base
  mount_uploder :excel_report, ExcelReportUploader
end                                                