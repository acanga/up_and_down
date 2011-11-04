module StockholderBaseReportsHelper
  def diff_columns_for(stockholder)
    diff_for(stockholder, :current_version => stockholder.amount_of_stocks_pn, :previous_version => stockholder.previous_version.try(:amount_of_stocks_pn)) +
      diff_for(stockholder, :current_version => stockholder.pn_percentage, :previous_version => stockholder.previous_version.try(:pn_percentage)) +
      diff_for(stockholder, :current_version => stockholder.amount_of_stocks_on, :previous_version => stockholder.previous_version.try(:amount_of_stocks_on)) +
      diff_for(stockholder, :current_version => stockholder.on_percentage, :previous_version => stockholder.previous_version.try(:on_percentage)) +
      diff_for(stockholder, :current_version => stockholder.total_stocks, :previous_version => stockholder.previous_version.try(:total_stocks)) +
      diff_for(stockholder, :current_version => stockholder.total_percentage, :previous_version => stockholder.previous_version.try(:total_percentage))
  end

  protected
    def diff_for(stockholder, versions = {})
      if not versions[:previous_version]
        content_tag :td, display_column(versions[:current_version]), :class => :cor_azul
      else
        content_tag :td, display_column(versions[:current_version]), :class => 
          td_class(:current_version => versions[:current_version], :previous_version => versions[:previous_version])
      end
    end

    def display_column(column)
      if column.is_a? Float
        number_with_precision column, :precision => 2
      else
        column
      end
    end

    def td_class(versions = {})
      if versions[:current_version] > versions[:previous_version]
        :cor_verde
      elsif versions[:current_version] < versions[:previous_version]
        :cor_vermelha
      else
        :cor_azul
      end
    end
end