class Help < ApplicationRecord
  enum gender: { male: 0, female: 1, other: 2 }
  enum type: { housing: 0, abuse: 1 }
end
