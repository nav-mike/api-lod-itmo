class ApplicationsController < ApplicationController
  before_action :set_application, only: %i(show update destroy)

  def index
    respond_to do |format|
      format.html { redirect_to 'https://rus-lod.herokuapp.com/apis' }
      format.json { @applications = Application.all.order(:id) }
    end
  end

  # get /applications/key.json
  def key
    key = ''
    loop do
      o = [('a'..'z'), ('A'..'Z'), (0..9)].map { |i| i.to_a }.flatten
      key = (0...10).map { o[rand(o.length)] }.join
      break if Application.where(key: key).size == 0
    end
    respond_to do |format|
      format.html { redirect_to 'https://rus-lod.herokuapp.com/apis' }
      format.json { render json: {key: key} }
    end
  end

  def show
    respond_to do |format|
      format.html { redirect_to 'https://rus-lod.herokuapp.com/apis' }
      format.json
    end
  rescue => e
    render json: {message: e.message}, status: :internal_server_error
  end

  def create
  end

  def update
  end

  def destroy
  end
  
  private
  
  def set_application
    if params[:id].present?
      @application = Application.find params[:id]
    elsif params[:key].present?
      @application = Application.find_by key: params[:key]
    else
      raise 'Missing params \'key\'!'
    end
  end
end
