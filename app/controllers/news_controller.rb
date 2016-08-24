class NewsController < ApplicationController
  def index
    respond_to do |format|
      format.html { redirect_to 'https://rus-lod.herokuapp.com/apis' }
      format.json { @news = News.all.order(:published_at) }
    end
  rescue => e
    render json: {message: e.message}, status: :internal_server_error
  end

  def show
    respond_to do |format|
      format.html { redirect_to 'https://rus-lod.herokuapp.com/apis' }
      format.json { @news = News.find params[:id] }
    end
  rescue => e
    render json: {message: e.message}, status: :internal_server_error
  end
end
