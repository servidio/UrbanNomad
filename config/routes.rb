Rails.application.routes.draw do

  resources :comments

  devise_for :users
  root 'trips#index'

  resources :trips

  resources :attractions

  get '/search', to: 'attractions#search', as: :attraction_search

  get '/usertrips', to: 'trips#usertrips', as: :user_trips

  get '/alltrips', to: 'trips#alltrips', as: :all_trips

end
