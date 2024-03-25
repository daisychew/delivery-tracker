class TrackingController < ApplicationController
  require 'httparty'
  
  BASE_URI = 'https://api.trackingmore.com/v4'

  def show
    tracking_number = params[:tracking_number]
    tracking_service = TrackingMoreService.new(ENV['TRACKING_MORE_API_KEY'])
    expected_delivery_date = tracking_service.get_tracking_info(tracking_number)

    if expected_delivery_date
      render json: { expected_delivery_date: expected_delivery_date }
    else
      render json: { error: 'Unable to retrieve tracking information.' }, status: :unprocessable_entity
    end
  end
end
