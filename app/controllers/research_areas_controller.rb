class ResearchAreasController < ApplicationController
  def index
    respond_to do |format|
      format.html { redirect_to 'http://rus-lod.herokuapp.com/apis' }
      format.json { @research_areas = ResearchArea.all }
    end
  end

  def show
    respond_to do |format|
      format.html { redirect_to 'http://rus-lod.herokuapp.com/apis' }
      format.json { @research_area = ResearchArea.find params[:id]; @research_area.include_laboratory! }
    end
  end
  
  def find_by_uri
    @research_areas = ResearchArea.where_uri(params[:uri])
    Statistic.update_count(params[:app_key], 'research_areas') if params[:app_key].present?
    render :index
  end
end
