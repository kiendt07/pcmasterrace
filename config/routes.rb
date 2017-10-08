Rails.application.routes.draw do
  resources :types
  resources :specifications
  resources :reviews
  resources :manufacturers
  resources :categories
  resources :components
  get 'components/new'

  root "static_pages#home"

  get "/help", to: "static_pages#help"
  get "/about", to: "static_pages#about"
  get "/contact", to: "static_pages#contact"

  get "/signup", to: "users#new"
  post "/signup", to: "users#create"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :users do
    resources :reviews, except: :index
  end
  resources :account_activations, only: :edit
  resources :password_resets, except: %i(index show destroy)
end
