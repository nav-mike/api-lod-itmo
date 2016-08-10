class PeopleController < ApplicationController
  def index
    respond_to do |format|
      format.html { redirect_to 'http::/rus-lod.herokuapp.com/apis' }
      format.json { @people = Person.all }
    end
  end

  def show
    respond_to do |format|
      format.html { redirect_to 'http://rus-lod.herokuapp.com/apis' }
      format.json { @person = Person.find params[:id] }
    end
  end
end
