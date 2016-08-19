class ApplicationsController < ApplicationController
  def index
    respond_to do |format|
      format.html { redirect_to 'https://rus-lod.herokuapp.com/apis' }
      format.json { @applications = Application.all.order(:id) }
    end
  end

  def show
  end

  def create
  end

  def update
  end

  def destroy
  end
end
