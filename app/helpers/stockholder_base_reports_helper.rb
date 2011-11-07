module StockholderBaseReportsHelper
  def diff_columns_for(stockholder)
    diff_between(:current_version => stockholder.amount_of_stocks_pn, :previous_version => stockholder.previous_version.try(:amount_of_stocks_pn)) +
      diff_between(:current_version => stockholder.pn_percentage, :previous_version => stockholder.previous_version.try(:pn_percentage)) +
      diff_between(:current_version => stockholder.amount_of_stocks_on, :previous_version => stockholder.previous_version.try(:amount_of_stocks_on)) +
      diff_between(:current_version => stockholder.on_percentage, :previous_version => stockholder.previous_version.try(:on_percentage)) +
      diff_between(:current_version => stockholder.total_stocks, :previous_version => stockholder.previous_version.try(:total_stocks)) +
      diff_between(:current_version => stockholder.total_percentage, :previous_version => stockholder.previous_version.try(:total_percentage))
  end

  protected
    def diff_between(versions = {})
      content_tag :td, display_column_with_versions(versions), :class => td_class_for_column_with_versions(versions)
    end

    def display_column_with_versions(versions = {})
      "#{format_value(versions[:current_version])} #{format_difference_between_versions(versions)}"
    end

    def td_class_for_column_with_versions(versions = {})
      if not versions[:previous_version]
        nil
      elsif versions[:current_version] > versions[:previous_version]
        :cor_verde
      elsif versions[:current_version] < versions[:previous_version]
        :cor_vermelha
      else
        :cor_azul
      end
    end

    def format_difference_between_versions(versions = {})
      diff_information = ""

      if versions[:previous_version]
        difference_between_versions = versions[:current_version] - versions[:previous_version]

        if difference_between_versions >= 0
          diff_information << "(+"
        else
          diff_information << "("
        end

        diff_information << "#{format_value(difference_between_versions)})"
      end

      diff_information
    end

    def format_value(value)
      precision = 0

      if value.is_a? Float
        precision = 2
      end

      number_with_precision value, :precision => precision
    end
end