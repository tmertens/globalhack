class IntakeForm < ApplicationRecord
  belongs_to :client, inverse_of: :intake_forms, required: false

  accepts_nested_attributes_for :client
end
