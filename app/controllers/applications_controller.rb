class ApplicationsController < ApplicationController
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }
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
    respond_to do |format|
      format.html { redirect_to 'https://rus-lod.herokuapp.com/apis' }
      format.json do
        @application = Application.new application_params
        @application.save!
        render json: {ok: true}, status: :ok
      end
    end
  rescue => e
    render json: {message: e.message}, status: :internal_server_error
  end

  def update
    respond_to do |format|
      format.html { redirect_to 'https://rus-lod.herokuapp.com/apis' }
      format.json do
        @application.update application_params
        @application.save!
        render json: {ok: true}, status: :ok
      end
    end
  rescue => e
    render json: {message: e.message}, status: :internal_server_error
  end

  def destroy
    respond_to do |format|
      format.html { redirect_to 'https"//rus-lod.herokuapp.com/apis' }
      format.json do
        @application.destroy
        render json: {ok: true}, status: :ok
      end
    end
  rescue => e
    render json: {message: e.message}, status: :internal_server_error
  end
  
  private

  def  application_params
    params.require(:application).permit(:name, :description, :link, :key)
  end

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
