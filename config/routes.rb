Rails.application.routes.draw do
  get 'sessions/new'
  resources :users
  resources :sessions
  resources :accomadations
  resources :locations
  resources :old_locations
  resources :new_locations
  post 'locations/withcountry' , to:'locations#withcountry'
  get 'user/create' , to:'users#create'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
