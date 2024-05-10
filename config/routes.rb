Rails.application.routes.draw do
  resources :contents do 
    member do
      get "public"
    end
  end
  devise_for :users, controllers: { registrations: 'registrations' }
 
 
  post 'valdash', to: 'pages#valdash'
  post 'newdash', to: 'pages#newdash'
  get 'dash', to: 'pages#dash'
  get 'home', to: 'pages#home'
  get 'docs', to: 'pages#docs'
  get 'pages/about'
  get 'changelog', to: "pages#changelog"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "pages#home"
end
