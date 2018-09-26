class Dataset < ApplicationRecord
  validates :url, uniqueness: true
  has_many :crashes, dependent: :destroy, as: :source

  @@base = "https://data.sncf.com/api/records/1.0/search//?dataset=incidents-securite&sort=date&q=collision&refine.type="

  def get_body_response(count= 0)
    uri = @@base + self.url
    uri += "&start=#{count.to_s}" if count
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
        a = self.crashes.new(body: crash['fields']['commentaires'], identifier: crash['recordid'], localisation: crash['fields']['localisation'], date: Date.parse(crash['fields']['date']))
        begin
          a.save
        rescue
          puts "here was a problem #{crash['localisation']} , #{crash['date']}"
        end
        full_index += 1 
      end
      if full_index < nhits
        res_body = get_body_response(full_index)
        break if res_body == nil
      end
    end
  end

  def select_them(res_body) 
    while full_index < nhits
      res_body['records'].each_with_index do |crash, index|

        a = self.crashes.find_or_initialize_by(body: crash['fields']['commentaires'], identifier: crash['recordid'], localisation: crash['fields']['localisation'], date: Date.parse(crash['fields']['date']))
        begin
          a.save
        rescue
          puts "here was a problem #{crash['localisation']} , #{crash['date']}"
        end
        full_index += 1 
      end
      if full_index < nhits
        res_body = get_body_response(full_index)
        break if res_body == nil
      end
    end
  end

  def api_upload
    body = get_body_response
    if body
      if  self.nb_of_crash == 0 || self.nb_of_crash == nil
        wrap_it_all(body)
      elsif self.nb_of_crash != body['nhits']
        select_them(body)
      end
      self.touch
    else
    end
  end
end
