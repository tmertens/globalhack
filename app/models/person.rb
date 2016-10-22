class Person < ApplicationRecord
  enum gender: {
    male:   0,
    female: 1,
    other:  2
  }

  belongs_to :client
end
