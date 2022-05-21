class PaymentRequestsController < ApplicationController
  before_action :authenticate_user!

  def index
    @payment_requests = PaymentRequest.all

    respond_to do |format|
      format.html
      format.json { render json: @payment_requests }
    end
  end

  def show
    @payment_request = PaymentRequest.find(params[:id])
    render json: @payment_request
  end

  def create
    @payment_request = PaymentRequest.new(payment_request_params)
    @payment_request.contractor = @current_user

    if @payment_request.save
      respond_to do |format|
        format.html { redirect_to action: index }
        format.json { render json: @payment_request }
      end
    else
      render json: @payment_request.errors, status: :unprocessable_entity
    end
  end

  def payment_request_params
    params.require(:payment_request).permit(:amount, :currency, :description)
  end

  def new
    @payment_request = PaymentRequest.new
  end

  private

  def authenticate_user!
    @current_user = Contractor.first
  end
end
