class Stockholder < ActiveRecord::Base
  belongs_to :stockholder_base_report

  # validates_presence_of :name, :kind, :amount_of_stocks_pn, :pn_percentage, :amount_of_stocks_on,
    # :on_percentage, :total_stocks
end