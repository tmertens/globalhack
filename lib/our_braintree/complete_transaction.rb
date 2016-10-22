module OurBraintree
  class CompleteTransaction

    def self.call(params)
      result = Braintree::Transaction.sale(
        amount: params['amount'],
        payment_method_nonce: params['payment_method_nonce'],
        options: {
          submit_for_settlement: true
        }
      )
      if result.success? || result.transaction
        possible_payment = PossiblePayment.includes(:client).find_by_digested_token(params['digested_token'])
        client = possible_payment.client
        organization = client.organizations.find(params['organization_id'])

        payment = Payment.new(
          client_id: possible_payment.client_id,
          organization_id: organization.id,
          possible_payment_id: possible_payment.id,

          clearing_house: 'braintree',
          transaction_id: result.transaction.id,

          amount: params['amount'],
          eff_date: Date.current,
        )
        payment.save!

        {
          success: true,
          value: {
            result: result,
            client: client,
            organization: organization,
            payment: payment
          }
        }
      else
        {
          success: false,
          value: result.errors.map { |error| "Error: #{error.code}: #{error.message}" }
        }
      end
    end

  end
end
