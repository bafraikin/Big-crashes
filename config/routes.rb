Rails.application.routes.draw do

  root to: 'home#index'

  get 'dataset/index', to: 'dataset#index', as: 'datasets' 
  get 'crash/by_years', to: 'crash#by_years', as: 'years'
  get 'crash/:identifier', to: 'crash#show', as: 'crash'
  get 'dataset/:id', to: 'dataset#crashes', as: 'data'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

   Rails.application.routes.draw do
      devise_for :admins, controllers: {
        sessions: 'admins/sessions'
      }
    end

end
