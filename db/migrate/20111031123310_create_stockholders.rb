class CreateStockholders < ActiveRecord::Migration
  def change
    create_table :stockholders do |t|
      t.references :stockholder_base_report
      t.string :name
      t.string :kind
      t.string :cpf_or_cnpj
      t.integer :amount_of_stocks_on
      t.float :on_percentage
      t.integer :amount_of_stocks_pn
      t.float :pn_percentage
      t.integer :total_stocks
      t.float :total_percentage

      t.timestamps
    end
  end
end