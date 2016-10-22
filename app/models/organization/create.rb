require 'verbalize'

class Organization < ApplicationRecord
  class Create
    include Verbalize

    input :name

    def call
      fail!('An organization requires a name') unless name.present?
      Organization.create!(name: name)
    end
  end
end
