class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def not_found
    respond_to do |format|
      format.html { redirect_to 'http://rus-lod.herokuapp.com/apis' }
      format.json do
        render json: {error: true, message: '404. See http://rus-lod.herokuapp.com/apis'}.to_json, status: :internal_server_error
      end
    end
  end
end
