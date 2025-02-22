require 'httparty'

class Movie
  include HTTParty
  base_uri 'http://www.omdbapi.com'
  API_KEY = '197c09b1'  
  def self.popular
    response = get("/?s=action&type=movie&apikey=#{API_KEY}")
    if response.success? && response.parsed_response["Response"] == "True"
      return response.parsed_response['Search']
    else
      puts "Error fetching popular movies: #{response.parsed_response}"
      return []
    end
  end

  def self.search(query)
    response = get("/?s=#{query}&type=movie&apikey=#{API_KEY}")
    if response.success? && response.parsed_response["Response"] == "True"
      return response.parsed_response['Search']
    else
      puts "Error searching movies: #{response.parsed_response}" 
      return []
    end
  end

  def self.find_by_id(id)
    response = get("/?i=#{id}&plot=full&apikey=#{API_KEY}")
    if response.success? && response.parsed_response["Response"] == "True"
      return response.parsed_response
    else
      puts "Error fetching movie by ID: #{response.parsed_response}"
      return nil
    end
  end
end
