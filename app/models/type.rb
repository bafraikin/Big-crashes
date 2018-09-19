class Type < ApplicationRecord
  validates :type, uniqueness: true
  validates :url, uniqueness: true
end
