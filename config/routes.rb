Rails.application.routes.draw do
  resources :reviews, only: [:create]
  resources :genres, except: :delete
  resources :bands, except: :delete
  resources :musicians, except: :delete

  get "/login", to: "sessions#new", as: 'login'
  post "/login", to: "sessions#create"
  delete "/logout", to: 'sessions#destroy', as: 'logout'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
