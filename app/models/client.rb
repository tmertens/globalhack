class Client < ApplicationRecord
  has_one :magic_phrase, primary_key: :uuid, foreign_key: :client_uuid

  has_one :person
  has_one :client_profile

  has_many :as_dependent_dependent_clients, class_name: 'DependentClient',
    primary_key: :id, foreign_key: :primary_client_id
  has_many :as_parent_dependent_clients,    class_name: 'DependentClient',
    primary_key: :id, foreign_key: :dependent_client_id

  has_many :dependents, class_name: 'Client', through: :as_dependent_dependent_clients
  has_many :parents,    class_name: 'Client', through: :as_parent_dependent_clients

  has_many :clients_organizations
  has_many :organizations, through: :clients_organizations
  has_many :contacts, as: :contactable

  has_many :intake_forms, inverse_of: :client

  # Pull out to module
  before_save :set_uuid
  def set_uuid
    self.uuid ||= SecureRandom.uuid
  end

end
