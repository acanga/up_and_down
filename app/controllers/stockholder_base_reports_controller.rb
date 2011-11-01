class StockholderBaseReportsController < InheritedResources::Base
  respond_to :html, :json, :xml, :js

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