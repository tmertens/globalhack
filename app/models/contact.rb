class Contact < ApplicationRecord
  belongs_to :contactable, polymorphic: true
  enum contact_type: { phone_number: 0, email_address: 1 }
end
