Rails.application.routes.draw do
  resources :usuarios
  get '/usuarios', to: 'usuarios#index', format: 'json'
  get '/usuarios', to: 'usuarios#show', format: 'json'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
