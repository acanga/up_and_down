class StockholderBaseReportsController < InheritedResources::Base
  before_filter :authenticate_user!

  def index
    @stockholder_base_report = StockholderBaseReport.new
    @stockholder_base_reports = StockholderBaseReport.scoped

    respond_with @stockholder_base_reports
  end
  
  protected
    def begin_of_association_chain
      current_user   
    end
end                                        