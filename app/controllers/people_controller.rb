class PeopleController < ApplicationController
  def index
    respond_to do |format|
      format.html { redirect_to 'http://rus-lod.herokuapp.com/apis' }
      format.json { @people = Person.all }
    end
  end

  def show
    respond_to do |format|
      format.html { redirect_to 'http://rus-lod.herokuapp.com/apis' }
      format.json { @person = Person.find params[:id] }
    end
  end
  
  def lab_index
    respond_to do |format|
      format.html { redirect_to 'http://rus-lod.herokuapp.com/apis' }
      format.json do
        raise 'Missing "laboratory_id" param!' if params[:laboratory_id].blank?
        @people = Person.find_by_laboratory(params[:laboratory_id].to_i)
        render :index
      end
    end
  rescue => e
    render json: {message: e.message}, status: :internal_server_error
  end
end
