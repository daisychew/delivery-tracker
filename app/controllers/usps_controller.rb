class UspsController < ApplicationController
  def track
    trackcode = params[:trackcode] 
    @tracking_info = UspsService.track_package(trackcode)
  end
end
