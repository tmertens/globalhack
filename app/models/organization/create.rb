require 'verbalize'

class Organization < ApplicationRecord
  class Create
    include Verbalize

    input :name, :owner

    def call
      fail!('An organization requires a name') unless name.present?
      Organization.create!(name: name, owner: owner)
    end
  end
end
