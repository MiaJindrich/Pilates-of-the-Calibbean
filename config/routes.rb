Rails.application.routes.draw do
  root "users#home"

  resources :users do
    resources :pirates do
      resources :ships do
        resources :ports
      end
      resources :houses
    end
  end
  resources :sessions, only: [:new, :create, :destroy]


  get "signup", to: "users#new", as: "signup"
  get "login", to: "sessions#new", as: "login"
  get "logout", to: "sessions#destroy", as: "logout"

  put "users/:user_id/pirates/:pirate_id/ships/:id/onboard", to: "pirates#onboard", as: "onboard"
  put "users/:user_id/pirates/:pirate_id/unboard", to: "pirates#unboard", as: "unboard"
  put "users/:user_id/pirates/:pirate_id/ships/:ship_id/port/:id/dock", to: "ships#dock", as: "dock"
  put "users/:user_id/pirates/:pirate_id/ship/:id/undock", to: "ships#undock", as: "undock"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
