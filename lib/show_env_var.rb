require_relative './show_env_var/version'
require 'net/http'
require 'json'
require 'pry'
require 'open-uri'
require 'nokogiri'

module ShowEnvVar
  class Show 

    def show_environment_var
      puts "make sure to set the HIKING_PROJECT_KEY"
      puts "$ export HIKING_PROJECT_KEY=xxx"
      puts "this is the hiking project key: #{ENV["HIKING_PROJECT_KEY"]}"
    end

    def show_nokogiri
      url = "https://www.hikingproject.com/data/get-trails?lat=39.7609154&lon=-105.0440525&maxDistance=10&key=#{ENV["HIKING_PROJECT_KEY"]}"
      uri = URI(url)
      response = Net::HTTP.get(uri)
      raw_trails = JSON.parse(response)
      puts raw_trails
    end

  end
end

