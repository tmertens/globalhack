require 'verbalize'

class Organization < ApplicationRecord
  class Create
    include Verbalize

    input :name, :owner, optional: [:universal]

    def call
      fail!('An organization requires a name') unless name.present?
      Organization.create!(name: name, owner: owner, universal: universal)
    end
  end
end
