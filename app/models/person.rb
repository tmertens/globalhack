class Person < ApplicationRecord
  enum gender: {
    male:   0,
    female: 1,
    other:  2
  }

  def self.humanized_genders
    genders.keys.map do |gender|
      [gender.humanize, gender]
    end
  end
  

  belongs_to :client
end
