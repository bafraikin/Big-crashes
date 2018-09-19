class Dataset < ApplicationRecord
  validates :name, uniqueness: true
  validates :url, uniqueness: true
  has_many :crashes, dependent: :destroy, as: :source

  @@base = "https://data.sncf.com/api/records/1.0/search//?dataset=incidents-securite&sort=date&q=collision&refine.type="

  def get_body_response(count=0)
    uri = @@base + self.url
    uri + "&start=#{count}" if count
    url_to_request = URI(uri)
    response = Net::HTTP.get_response(url_to_request)
    if response.is_a?(NET::HTTPSuccess)
      JSON.parse(response.body)
    end
  end

  def update
    body = get_body_response
    if !self.nb_of_crash
      body['nhits'] 
      
    elsif self.nb_of_crash != body['nhits']

    end
  end
end
