Rails.application.routes.draw do
  root to: "posts#index"
  resources :posts do
    post "confirm", on: :new
  end
  
  resources :users

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
