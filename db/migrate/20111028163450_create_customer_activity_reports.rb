class CreateCustomerActivityReports < ActiveRecord::Migration
  def change
    create_table :customer_activity_reports do |t|

      t.timestamps
    end
  end
end
