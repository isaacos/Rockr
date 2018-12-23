Rails.application.routes.draw do
  resources :musician_bands
  resources :genre_musicians
  resources :genres
  resources :bands
  resources :musicians
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
