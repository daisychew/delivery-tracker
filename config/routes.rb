Rails.application.routes.draw do
  devise_for :users

  # Delivery views
  get("delivery/all", controller: "deliveries", action: "index")
  
  get("delivery/:id", controller: "deliveries", action: "show")

  # Updating deliveries

  post("insert_delivery", { :controller => "deliveries", :action => "create" })

  post("modify_delivery/:id", controller: "deliveries", action: "receive")
 
  get("delete_delivery/:id", controller: "deliveries", action: "delete")


  # USPS API

  get("/track_usps", to: 'usps#track')
 
  
  # Defines the root path route ("/")
  root "delivery#homepage"
end
