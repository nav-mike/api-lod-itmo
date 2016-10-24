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
      format.json { @research_area = ResearchArea.find params[:id] }
    end
  end
  
  def find_by_uri
    @research_areas = ResearchArea.where_uri(params[:uri])
    render :index
  end
end
