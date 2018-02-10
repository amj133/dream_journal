Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show] do
    resources :dreams, only: [:new, :create, :edit, :update]
  end

  resources :dreams, only: [:show]

end
