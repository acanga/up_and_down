class StockholderBaseReportsController < InheritedResources::Base
  actions :all, :except => [ :edit, :update, :show, :destroy ]

  before_filter :authenticate_user!

  def index
    @stockholder_base_report = StockholderBaseReport.new
    
    index!
  end

  def create
    @stockholder_base_reports = current_user.stockholder_base_reports
    @stockholder_base_report = current_user.stockholder_base_reports.new(params[:stockholder_base_report])

    if @stockholder_base_report.save
      redirect_to stockholder_base_reports_path
    else
      render :action => :index
    end
  end
  
  protected
    def begin_of_association_chain
      current_user   
    end
end                                        