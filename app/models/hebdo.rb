class Hebdo < ApplicationRecord
  has_many :crashes, dependent: :destroy
end
