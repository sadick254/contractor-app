class PaymentResponseWorker
  include Sneakers::Worker
  from_queue "payment.response", env: nil

  def work(raw_message)
    payment_response = JSON.parse(raw_message)
    payment_request = PaymentRequest.find(payment_response['id'])

    if payment_response['status'] == 'approved'
      payment_request.status = :approved
    else
      payment_request.status = :rejected
    end

    payment_request.save

    puts "Received: #{raw_message}"
    ack!
  end
end