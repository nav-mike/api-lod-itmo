class LaboratoriesController < ApplicationController
  def index
    respond_to do |format|
      format.html { redirect_to 'http://rus-lod.herokuapp.com/apis' }
      format.json { @laboratories = Laboratory.all }
    end
  end

  def show
  end
end
