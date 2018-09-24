class Dataset < ApplicationRecord
  validates :url, uniqueness: true
  validates :identifier, uniqueness: true
  has_many :crashes, dependent: :destroy, as: :source

  @@base = "https://data.sncf.com/api/records/1.0/search//?dataset=incidents-securite&sort=date&q=collision&refine.type="

  def get_body_response(count=0)
    uri = @@base + self.url
    uri + "&start=#{count}" if count
    url_to_request = URI(uri)
    response = Net::HTTP.get_response(url_to_request)
    if response.is_a?(Net::HTTPSuccess)
      JSON.parse(response.body)
    end
  end

  def wrap_it_all(res_body)
    nhits = res_body['nhits']
    full_index = 0
    while full_index < nhits
      res_body['records'].each_with_index do |crash, index|
        begin
        self.crashes.create(body: crash['commentaires'], identifier: crash['recordid'], localisation: crash['localisation'], date: Date.parse(crash['date']))
        rescue
          puts "here was a problem #{crash['localisation']} , #{crash['date']}}"
        end
        full_index += 1 
      end
      if full_index < nhits
        res_body = get_body_response(full_index)
        break if res_body == nil
      end
    end
  end

  def update
    body = get_body_response
    if body
      if !self.nb_of_crash
        wrap_it_all(body)
      elsif self.nb_of_crash != body['nhits']

      end
    end
  end
end
