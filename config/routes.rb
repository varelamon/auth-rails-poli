Auth::Application.routes.draw do


  root :to => "home#index"
  devise_for :users, :controllers => {unlocks: 'unlocks', sessions: 'sessions', registrations: "registrations", passwords: 'passwords', confirmations: "confirmations"}, skip: [:sessions]
  as :user do
   delete 'logout', to: 'sessions#destroy', as: :destroy_session
   get 'login', to: 'sessions#new', as: :new_session
   post 'login', to: 'sessions#create', as: :session
 end
  resources :users
  resources :questions
  resources :answers, only: :index do
  	post 'verify', on: :collection
  end
end