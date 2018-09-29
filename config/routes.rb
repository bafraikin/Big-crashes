Rails.application.routes.draw do
  devise_for :admins

  root to: 'home#index'
  get "crash/:identifier", to: "crash#show", as: "crash"
  get "dataset/:name", to: "dataset#crashes", as: "data"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
