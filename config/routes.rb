Rails.application.routes.draw do
  devise_for :users
  # Waiting on deliveries
  get("/waiting_on", controller: "waiting_on", action: "index")
  
  get("/waiting_on/:id", controller: "waiting_on", action: "show")


  # Arrived deliveries

  get("/arrived", controller: "arrived", action: "index")
  
  get("/arrived/:id", controller: "arrived", action: "show")


  # Updating deliveries

  post("insert_delivery", { :controller => "delivery", :action => "create" })

  post("modify_delivery/:id", controller: "delivery", action: "receive")
 
  get("delete_delivery/:id", controller: "delivery", action: "delete")


  # USPS API

  get("/track_usps", to: 'usps#track')
 
  
  # Defines the root path route ("/")
  root "delivery#homepage"
end
