class Hebdo < ApplicationRecord
  has_many :crashes, dependent: :destroy

  def self.next
    good = Hebdo.find_by(scraped: false)
    if good
      good
    else
      Hebdo.all.order(:last_scrap).first
    end
  end

end
