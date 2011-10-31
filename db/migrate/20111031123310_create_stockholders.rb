class CreateStockholders < ActiveRecord::Migration
  def change
    create_table :stockholders do |t|
      t.string :name
      t.string :kind
      t.string :cpf
      t.string :cnpj
      t.integer :amount_of_stocks_pn
      t.float :pn_percentage
      t.integer :amount_of_stocks_on
      t.float :on_percentage
      t.integer :total_stocks

      t.timestamps
    end
  end
end
