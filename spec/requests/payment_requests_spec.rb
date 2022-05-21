require 'rails_helper'

RSpec.describe "PaymentRequests", type: :request do
  describe "GET /payment_requests" do
    it'should return all payment requests' do
      FactoryBot.create(:payment_request)

      get "/payment_requests.json"
      payment_request = PaymentRequest.first
      json_response = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(json_response.length).to eq(1)
      expect(json_response).to eq([payment_request.as_json])
    end
  end

  describe "POST /payment_requests" do
    it "should create a new payment request" do
      contractor = FactoryBot.create(:contractor)
      payment_request_params = {
        amount: 100,
        currency: "USD",
        description: "Payment for something"
      }

      post "/payment_requests", params: {payment_request: payment_request_params}
      json_response = JSON.parse(response.body)
      payment_request = PaymentRequest.first

      expect(response).to have_http_status(201)
      expect(json_response).to eq(payment_request.as_json)
      expect(payment_request.amount).to eq(payment_request_params[:amount])
      expect(payment_request.currency).to eq(payment_request_params[:currency])
      expect(payment_request.description).to eq(payment_request_params[:description])
      expect(payment_request.contractor).to eq(contractor)
    end
  end

  describe "GET /payment_requests/:id" do
    it "should return a payment request" do
      payment_request = FactoryBot.create(:payment_request)

      get "/payment_requests/#{payment_request.id}"
      json_response = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(json_response).to eq(payment_request.as_json)
    end
  end
end
