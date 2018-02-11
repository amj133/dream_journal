Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show] do
    resources :dreams, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :dreams, only: [:show] do
    resources :comments, only: [:create]
  end

end
