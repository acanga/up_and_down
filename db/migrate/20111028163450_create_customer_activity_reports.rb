class CreateStockholderBaseReports < ActiveRecord::Migration
  def change
    create_table :stockholder_base_report do |t|

      t.timestamps
    end
  end
end
