# encoding: utf-8

class StockholderBaseReportsController < InheritedResources::Base
  actions :all, :except => [ :edit, :update, :show, :destroy ]

  before_filter :authenticate_user!

  def index
    @stockholder_base_report = StockholderBaseReport.new
    
    index!
  end

  def create
    @stockholder_base_reports = StockholderBaseReport.scoped
    @stockholder_base_report = current_user.stockholder_base_reports.create(params[:stockholder_base_report])
    @new_stockholder_base_report = StockholderBaseReport.new

    render :action => :index
  end
  
  protected
    def begin_of_association_chain
      current_user   
    end
end                                        