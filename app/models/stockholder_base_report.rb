class StockholderBaseReport < ActiveRecord::Base
  belongs_to :user
  has_many :stockholders

  include StockholderBaseReport::ExcelReport
end