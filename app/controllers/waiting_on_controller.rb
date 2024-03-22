class WaitingOnController < ApplicationController
  def index
    @deliveries = Delivery.all
 
    render(template: "waiting_on/index")
  end

  def show
    @deliveries = Delivery.all
    delivery_id = params.fetch(:id)

    render(template: "waiting_on/show")
  end
end
