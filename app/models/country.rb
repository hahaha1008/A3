require 'httparty'

class Country
  include HTTParty
  base_uri 'https://restcountries.com/v3.1'

  def self.all
    response = get('/all')
    response.success? ? response.parsed_response : []
  end

  def self.search(query)
    response = get("/name/#{query}")
    response.success? ? response.parsed_response : []
  end

  def self.find_by_code(code)
    response = get("/alpha/#{code}")
    response.success? ? response.parsed_response.first : nil
  end
end
