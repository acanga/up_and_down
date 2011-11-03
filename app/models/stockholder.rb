# encoding: utf-8

class Stockholder < ActiveRecord::Base
  belongs_to :stockholder_base_report

  validates_presence_of :name, :kind, :cpf_or_cnpj, :amount_of_stocks_on,
    :on_percentage, :amount_of_stocks_pn, :pn_percentage, :total_stocks

  def self.create_from_excel_row(excel_row)
    cpf_or_cnpj = excel_row[2].to_s

    # if cpf_or_cnpj.length == 18
      kind = "Pessoa Jurídica"
    # else
    #   kind = "Pessoa Física"
    # end

    create(:name => excel_row[0],
      :kind => kind, :cpf_or_cnpj => cpf_or_cnpj, 
      :amount_of_stocks_on => excel_row[3],
      :on_percentage => excel_row[4],
      :amount_of_stocks_pn => excel_row[5],
      :pn_percentage => excel_row[6],
      :total_stocks => excel_row[7])
  end
end