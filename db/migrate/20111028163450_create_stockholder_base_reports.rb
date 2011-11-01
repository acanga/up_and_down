class CreateStockholderBaseReports < ActiveRecord::Migration
  def change
    create_table :stockholder_base_reports do |t|
      t.references :user
      t.boolean :unparsed, :default => false
      t.string :excel_report  

      t.timestamps
    end
  end
end