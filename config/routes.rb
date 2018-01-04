Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :pets

  resources :users do
  	resources :pets
  end
  # NOTE: we have 2 resources route. clean up?
  resources :battles

  get "/users/verify/:id", to: "users#verify"
  put "/users/:id/edit", to: "users#update"

  get "/sessions/new", to: "sessions#new"
  delete "/sessions", to: "sessions#destroy"
  post "/sessions", to: "sessions#create"

  root to: "sessions#new"

  put "/pets/:id/votes", to: "pets#vote"
  resources :battles

  get "/no_access", to: "errors#no_access"
  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all
end
