Rails.application.routes.draw do
  devise_for :users

  # Delivery views
  get("/delivery/all", controller: "delivery", action: "index", as: "deliveries")
  
  get("/delivery/:id", controller: "delivery", action: "show", as: "delivery")


  # Updating deliveries

  post("/insert_delivery", controller: "delivery", action: "create")

  post("/modify_delivery", controller: "delivery", action: "update")

  post("/receive_delivery/:id", controller: "delivery", action: "receive")
 
  post("/delete_delivery/:id", controller: "delivery", action: "delete")


  # Utilize the tracking service API

  get("/delivery/:tracking_number", to: 'tracking#show')
  
  
  # Defines the root path route ("/")
  root "delivery#homepage"
end
