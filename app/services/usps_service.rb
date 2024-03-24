require 'httparty'

class UspsService
  include HTTParty
  base_uri 'https://solarsolution-usps-tracking-v1.p.rapidapi.com'
  headers 'X-RapidAPI-Key' => 'e529161361mshcdda9fec2b1d919p1a3258jsned896edaffdf',
          'X-RapidAPI-Host' => 'solarsolution-usps-tracking-v1.p.rapidapi.com'

  def self.track_package(trackcode)
    response = get("/tracking/USPS?trackcode=#{trackcode}")
    return response.body if response.success?
    nil
  end
end
