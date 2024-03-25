require 'httparty'

class TrackingMoreService
  include HTTParty
  base_uri 'https://api.trackingmore.com/v4'
  
  def initialize(api_key)
    @api_key = api_key
  end

  def get_tracking_info(tracking_number)
    response = self.class.get("/trackings/get/#{tracking_number}", headers: { 'Tracking-Api-Key' => @api_key })
    if response.success?
      tracking_data = response.parsed_response['data']
      return parse_tracking_info(tracking_data)
    else
      return nil
    end
  end

  private

  def parse_tracking_info(tracking_data)
    # Extract relevant information such as expected delivery date
    delivery_status = tracking_data['delivery_status']
    if delivery_status == 'delivered'
      return tracking_data['trackinfo'].last['checkpoint_date']
    elsif delivery_status == 'transit'
      
      # Calculate expected delivery date based on transit time
      transit_time = tracking_data['transit_time']
      last_checkpoint_time = Time.parse(tracking_data['trackinfo'].last['checkpoint_date'])
      expected_delivery_date = last_checkpoint_time + transit_time.days
      return expected_delivery_date
    else
      return nil
    end
  end
end
