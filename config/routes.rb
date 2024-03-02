Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  post("insert_delivery", { :controller => "delivery", :action => "create" })

  post("modify_delivery/:id", controller: "delivery", action: "receive")
 
  get("delete_delivery/:id", controller: "delivery", action: "delete")
 
  # Defines the root path route ("/")
  root "delivery#index"
end
