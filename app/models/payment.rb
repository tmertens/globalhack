class Payment < ApplicationRecord

  belongs_to :client
  belongs_to :organization
  belongs_to :possible_payment

  monetize :amount_cents

end
