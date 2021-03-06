Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


   root "application#home"

   get '/private_feed', to: 'pictures#private_feed'

   resources :pictures
   resources :relationships, only: [:create, :destroy]

end
