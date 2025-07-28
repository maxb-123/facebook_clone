Rails.application.routes.draw do
  # Devise routes for user authentication
  devise_for :users

  # Resources for posts with nested comments and likes
  resources :posts do
    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
  end

  # Each user's profile can be viewed via /users/:id
  resources :users, only: [:show]

  # Root path of the application
  root to: 'posts#index'
end