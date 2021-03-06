Rails.application.routes.draw do
  resources :grades 
  resources :climb_types do
    resources :climbs, only: [:new, :create, :index]
  end 
  resources :comments
  resources :climbs
  
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root to: 'static#home'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
