class Dataset < ApplicationRecord
  validates :name, uniqueness: true
  validates :url, uniqueness: true
  has_many :crashes, dependent: :destroy, as: :source
end
