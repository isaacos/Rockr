Rails.application.routes.draw do
  resources :reviews
  get 'sessions/new'
  resources :musician_bands
  resources :genre_musicians
  resources :genres
  resources :bands
  resources :musicians

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: 'sessions#destroy'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
