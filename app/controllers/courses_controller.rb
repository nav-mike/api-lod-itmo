class CoursesController < ApplicationController
  def index
    respond_to do |format|
      format.html { redirect_to 'https://rus-lod.herokuapp.com/apis' }
      format.json { @courses = Course.all.order(:name) }
    end
  rescue => e
    render json: {message: e.message}, status: :internal_server_error
  end
end