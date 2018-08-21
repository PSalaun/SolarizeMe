Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'pages#home'

  # resources :projects

  resources :projects, only: [:index, :show] do
    collection do
      get "top", to: "projects#top", as: :top
    end
  end

  resources :investments, only: [:new]

  resources :users, only: [:show] do
    resources :investments, only: [:index]
  end

  get "learn_more", to: "pages#learn_more", as: :learn_more

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
