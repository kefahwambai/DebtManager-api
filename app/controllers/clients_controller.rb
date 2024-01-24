class ClientsController < ApplicationController
  before_action :authenticate_request!, except: :create
 

  # GET /clients
  def index
    @clients = current_user!.clients
    render json: @clients
  end

  # GET /clients/1

  def show
    @client = Client.find(params[:id])
    render json: @client
  end
  

  # POST /clients
  def create

    @client = current_user!.clients.build(client_params)   

    if @client.save
      render json: @client, status: :created, location: @client
    else
      render json: @client.errors, status: :unprocessable_entity
    end
  end
 

  # PATCH/PUT /clients/1
  def update
    if @client.update(client_params)
      render json: @client
    else
      render json: @client.errors, status: :unprocessable_entity
    end
  end

  # DELETE /clients/1
  def destroy
    @client.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_client
    @client = Client.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def client_params
    params.permit(:name, :email, :phonenumber, :image, :image_url)
  end
end
  