Rails.application.routes.draw do
  get 'users/show'
  devise_for :users

  resources :homes, only: [ :index, :show, :destroy, :new, :create, :edit, :update ] do
    resources :listings, only: [:create]
  end

  root to: 'pages#home'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
