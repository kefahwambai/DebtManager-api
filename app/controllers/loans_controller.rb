class LoansController < ApplicationController
  
  before_action :authenticate_request!
  before_action :set_loan, only: [:show, :update, :destroy]
  skip_before_action :set_loan, only: [:create]

  # GET /loans
  # GET /loans
  def index
    if params[:clientId].present?
      @loans = Loan.where(client_id: params[:clientId])
    else
      @loans = Loan.all
    end

    render json: @loans
  end


  # GET /loans/1
  def show
    render json: @loan
  end

  
  # POST /loans
  # def create
  #   # Check if the client with the given client_id exists
  #   client = Client.find_by(id: params[:client_id])

  #   if client.nil?
  #     render json: { error: 'Invalid client ID' }, status: :unprocessable_entity
  #     return
  #   end

  #   # If the client exists, create the loan
  #   @loan = Loan.new(loan_params)

  #   if @loan.save
  #     render json: @loan, status: :created, location: @loan
  #   else
  #     render json: @loan.errors, status: :unprocessable_entity
  #   end
  # end
  def create
    puts "Received params: #{params.inspect}"
    @loan = Loan.new(loan_params)
    puts "Loan Params: #{loan_params.inspect}"
  
    if @loan.save
      render json: @loan, status: :created, location: @loan
    else
      render json: @loan.errors, status: :unprocessable_entity
    end
  end
  


  # PATCH/PUT /loans/1
  def update
    if @loan.update(loan_params)
      render json: @loan
    else
      render json: @loan.errors, status: :unprocessable_entity
    end
  end

  # DELETE /loans/1
   
  def destroy
    if @loan
      @loan.destroy
      render json: { message: 'Loan deleted successfully' }, status: :ok
    else
      render json: { error: 'Loan not found' }, status: :not_found
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loan
      @loan = Loan.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def loan_params
      params.permit(:amount, :interest_rate, :interest_amount, :start_date, :client_id)
    end
    
end
