Rails.application.routes.draw do

  devise_for :users
  root 'static_pages#home'

  namespace :api do
    resources :powder_rooms, defaults: { format: 'json' }
  end
  
end
