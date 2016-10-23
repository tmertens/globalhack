class PaymentsController < ActionController::Api

  def client_token
    render OurBraintree::GenerateClientToken.call
  end

  def customer_client_token
    render OurBraintree::GenerateClientToken(customer_id: current_customer.uuid)
  end

end
