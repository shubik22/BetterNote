BetterNote::Application.routes.draw do
  root to: "notes#index"
  resources :users, only: [:create, :new, :show, :index] do
    resources :friend_requests, only: [:create] do
      post "accept", to: "friend_requests#accept"
      post "deny", to: "friend_requests#deny"
    end
    resources :friendships, only: [:destroy]
  end
  resources :likes, only: [:destroy]
  resources :notes, only: [:index, :show, :edit, :update, :destroy] do
    resources :comments, only: [:create]
    resources :likes, only: [:create]
  end
  resources :comments, only: [:destroy]
  resources :tags
  resources :notebooks do
    resources :notes, only: [:create]
  end
  resource :session, only: [:create, :new, :destroy]
end