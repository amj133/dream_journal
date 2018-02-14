Rails.application.routes.draw do

  root to: "welcome#index"

  resources :users, only: [:index, :show, :new, :create] do
    resources :dreams, only: [:create, :edit, :update, :destroy]
  end

  resources :dreams, only: [:show, :new] do
    resources :comments, only: [:create]
    get '/add_category' => 'application#add_category'
    get '/create_add_category' => 'application#create_add_category'
  end

  resources :categories, only: [:index, :show]

  namespace :admin do
    resources :categories, only: [:new, :create, :edit, :update, :destroy]
    resources :comments, only: [:destroy]
  end

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
end
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
