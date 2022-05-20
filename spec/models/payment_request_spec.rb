require 'rails_helper'

RSpec.describe PaymentRequest, type: :model do
  it "should not raise error when getting contractor" do
    expect{FactoryBot.build(:payment_request).contractor}.not_to raise_error
  end
end
