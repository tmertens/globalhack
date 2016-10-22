require 'braintree'

module OurBraintree
  module GenerateClientToken
    extend self

    def call(customer_id: nil)
      if customer_id
        Braintree::ClientToken.generate(
          customer_id: customer_id,
          merchant_account_id: Braintree::Configuration.merchant_id,
        )
      else
        Braintree::ClientToken.generate(
          merchant_account_id: Braintree::Configuration.merchant_id,
        )
      end
    end

  end
end
