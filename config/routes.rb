Rails.application.routes.draw do
  devise_for :users

  # Delivery views
  get("delivery/all", controller: "delivery", action: "index")
  
  get("delivery/:id", controller: "delivery", action: "show")


  # Updating deliveries

  post("insert_delivery", controller: "delivery", :action => "create")

  post("modify_delivery", controller: "delivery", action: "receive")
 
  # get("delete_delivery/:id", controller: "delivery", action: "delete")


  # Utilize the tracking service API

  get("delivery/:tracking_number", to: 'tracking#show')
  
  
  # Defines the root path route ("/")
  root "delivery#homepage"
end
