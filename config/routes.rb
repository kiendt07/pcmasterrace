Rails.application.routes.draw do
  resources :types
  resources :specifications
  resources :reviews
  resources :manufacturers
  resources :categories
  resources :components
  get 'components/new'

  root "components#index"

  get "/help", to: "static_pages#help"
  get "/about", to: "static_pages#about"
  get "/contact", to: "static_pages#contact"

  get "/signup", to: "users#new"
  post "/signup", to: "users#create"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get '/auth/:provider/callback', :to => 'sessions#create'
  get '/auth/failure', :to => 'sessions#failure'

  resources :users
  resources :account_activations, only: :edit
  resources :password_resets, except: %i(index show destroy)
end
