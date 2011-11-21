# encoding: utf-8

class Stockholder < ActiveRecord::Base
  belongs_to :stockholder_base_report

  validates_presence_of :name, :kind, :cpf_or_cnpj, :amount_of_stocks_on,
    :on_percentage, :amount_of_stocks_pn, :pn_percentage, :total_stocks

  has_paper_trail

  def self.create_or_update_from_excel_row(excel_row, data = {})
    stockholder = Stockholder.where(:name => excel_row[0]).first

    if stockholder
      stockholder.update_from_excel_row excel_row, :uploaded_on => data[:uploaded_on]
    else
      create_from_excel_row excel_row, :uploaded_on => data[:uploaded_on]
    end
  end

  def update_from_excel_row(excel_row, data = {})
    update_attributes Stockholder.attributes_hash_from_excel_row(excel_row).merge({ :stockholder_base_report_id => data[:uploaded_on].id })
  end

  protected
    def self.create_from_excel_row(excel_row, data = {})
      create attributes_hash_from_excel_row(excel_row).merge({ :stockholder_base_report_id => data[:uploaded_on].id })
    end

    def self.attributes_hash_from_excel_row(excel_row)
      cpf_or_cnpj = excel_row[2].to_s

      if excel_row[1].strip.length == 14
        kind = "Pessoa Jurídica"
      else
        kind = "Pessoa Física"
      end

      { 
        :name => excel_row[0],
        :kind => kind, :cpf_or_cnpj => cpf_or_cnpj, 
        :amount_of_stocks_on => excel_row[3],
        :on_percentage => excel_row[4],
        :amount_of_stocks_pn => excel_row[5],
        :pn_percentage => excel_row[6],
        :total_stocks => excel_row[7],
        :total_percentage => excel_row[8] 
      }
    end
end