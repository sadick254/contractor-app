require 'rails_helper'

RSpec.describe Contractor, type: :model do
  it "should not raise an error when getting payment_requests" do
    expect{FactoryBot.build(:contractor).payment_requests}.not_to raise_error
  end
end
