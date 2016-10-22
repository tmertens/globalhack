require 'grape'

module HousingFirst
  module Api
    class Base < Grape::API
      namespace :api do
        # Mount APIs here
      end
    end
  end
end
