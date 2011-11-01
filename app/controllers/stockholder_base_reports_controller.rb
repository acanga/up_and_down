class StockholderBaseReportsController < InheritedResources::Base
  before_filter :authenticate_user!

  def index
    @stockholder_base_report = StockholderBaseReport.new
    
    index!
  end
  
  protected
    def begin_of_association_chain
      current_user   
    end
end                                        