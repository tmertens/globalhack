class Client < ApplicationRecord
  has_one :person

  has_many   :dependent_clients, class_name: 'Client', foreign_key: 'primary_client_id'
  belongs_to :primary_client,    class_name: 'Client'

  has_many :clients_organizations
  has_many :organizations, through: :clients_organizations
  has_many :contacts, as: :contactable



  # Pull out to module
  before_save :set_uuid
  def set_uuid
    self.uuid ||= SecureRandom.uuid
  end

end
