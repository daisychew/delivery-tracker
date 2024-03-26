class DeliveryController < ApplicationController
  def homepage
    render(template: "delivery/homepage")
  end

  def index
    per_page = 25
    @current_page = params.fetch(:page, 1).to_i
    offset = (@current_page - 1) * per_page

    @deliveries = Delivery.limit(per_page).offset(offset)
    @total_pages = (Delivery.count.to_f / per_page).ceil
    
    render(template: "delivery/index")
  end
 
  def create
    delivery = Delivery.new
    delivery.tracking_number = params.fetch("query_tracking")
    delivery.order_number = params.fetch("query_number")
    delivery.notes = params.fetch("query_notes")
    delivery.arrived = false
    delivery.delivery_date = Date.today

    delivery.save
    flash[:notice] = "Added to list"
 
    redirect_to("/")
  end

  def update
    selected_action = params[:action]
    selected_packages = params[:selected_packages]

    case selected_action
    when 'mark_as_received'
      selected_packages.each do |package_id|
        delivery = Delivery.find(package_id)
        delivery.update(arrived: true)
      end
      flash[:success] = "Selected packages marked as received."
    when 'delete'
      Delivery.destroy(selected_packages)
      flash[:success] = "Selected packages deleted."
    else
      flash[:error] = "Invalid action."
    end

    redirect_back(fallback_location: root_path)
  end
 
  def receive
    delivery_id = params.fetch(:id)
    delivery = Delivery.where(id: delivery_id).at(0)
    delivery.arrived = true
    delivery.save

    redirect_to("/delivery/all")
  end
 
 
  def delete
    delivery_id = params.fetch(:id)
    delivery = Delivery.where(id: delivery_id).at(0)
    delivery.destroy

    redirect_to("/delivery/all")
  end

 end
 