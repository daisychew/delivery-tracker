class ArrivedController < ApplicationController
  def index
    @deliveries = Delivery.all
 
    render(template: "arrived/index")
  end

  def show
    @deliveries = Delivery.all
    delivery_id = params.fetch(:id)

    render(template: "arrived/show")
  end
end
