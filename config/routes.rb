Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show] do
    resources :dreams, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :dreams, only: [:show] do
    resources :comments, only: [:create]
    get '/add_category' => 'application#add_category'
    get '/create_add_category' => 'application#create_add_category'
  end

  resources :categories, only: [:index, :show]

end
