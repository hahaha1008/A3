require 'httparty'

class Country
  include HTTParty
  base_uri 'https://restcountries.com/v3.1'

  def self.all
    response = get('/all')
    response.success? ? response.parsed_response : []
  end

  def self.search(name)
    response = get("/name/#{name}")
    response.success? ? response.parsed_response : []
  end
end
