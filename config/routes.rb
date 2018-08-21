Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'pages#home'

  resources :projects, only: [:index, :show]

  resources :projects do
    collection do
      get "top3"
    end
  end

  resources :investments, only: [:new]

  resources :users do
    resources :investments, only: [:index]
  end

  resources :users, only: [:show]


  get "learn_more", to: "pages#learn_more", as: :learn_more

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
