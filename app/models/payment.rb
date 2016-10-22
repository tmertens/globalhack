class Payment < ApplicationRecord
  belongs_to :client
  belongs_to :organization
end
