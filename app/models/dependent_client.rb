class DependentClient < ApplicationRecord
  belongs_to :parent,   class_name: 'Client', primary_key: :id, foreign_key: :primary_client_id
  belongs_to :dependent, class_name: 'Client', primary_key: :id, foreign_key: :dependent_client_id

end
