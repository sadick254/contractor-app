FactoryBot.define do
  factory :payment_request do
    amount { "" }
    currency { "MyString" }
    description { "MyText" }
    contractor { nil }
  end
end
