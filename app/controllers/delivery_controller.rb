class DeliveryController < ApplicationController
  def index
    @deliveries = Delivery.all
 
    render({ :template => "delivery/index" })
  end
 
 
  def create
    delivery = Delivery.new
    delivery.description = params.fetch("query_description")
    delivery.supposed_to_arrive_on = params.fetch("query_date")
    delivery.details = params.fetch("query_details")
    delivery.arrived = false

    if delivery.supposed_to_arrive_on != nil && delivery.description != nil
      delivery.save
    end
 
    redirect_to("/")
  end
 
 
  def receive
    delivery_id = params.fetch(:id)
    delivery = Delivery.where(id: delivery_id).at(0)
    delivery.arrived = true
    delivery.save

    redirect_to("/")
  end
 
 
  def delete
    delivery_id = params.fetch(:id)
    delivery = Delivery.where(id: delivery_id).at(0)
    delivery.destroy
    
    redirect_to("/")
  end
 end
 