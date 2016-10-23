class IntakeForm < ApplicationRecord
  belongs_to :client, inverse_of: :intake_forms, required: false
  has_one :person, through: :client

  accepts_nested_attributes_for :client
  accepts_nested_attributes_for :person
end
