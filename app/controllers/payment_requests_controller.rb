class PaymentRequestsController < ApplicationController
  before_action :authenticate_user!

  def index
    payment_requests = PaymentRequest.all
    render json: payment_requests
  end

  def show
    @payment_request = PaymentRequest.find(params[:id])
    render json: @payment_request
  end

  def create
    @payment_request = PaymentRequest.new(payment_request_params)
    @payment_request.contractor = @current_user

    if @payment_request.save
      render json: @payment_request, status: :created, location: @payment_request
    else
      binding.pry
      render json: @payment_request.errors, status: :unprocessable_entity
    end
  end

  def payment_request_params
    params.require(:payment_request).permit(:amount, :currency, :description)
  end

  private

  def authenticate_user!
    @current_user = Contractor.first
  end
end
