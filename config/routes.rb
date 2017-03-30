Rails.application.routes.draw do
  match "/usuario/:id" => "usuario#update", via: :post
  match "/usuario" => "usuario#create", via: :put
  match "/usuario/:id" => "usuario#show", via: :get
  match "/usuario/:id" => "usuario#destroy", via: :delete
  match "/usuario" => "usuario#index", via: :get



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
