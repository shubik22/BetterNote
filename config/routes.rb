BetterNote::Application.routes.draw do
  root to: "static_pages#home"
  resources :users, only: [:create, :new, :show, :index] do
    resources :notes, only: [:index, :show, :edit, :update, :destroy] do
      resources :comments, only: [:new, :create, :destroy]
      resources :likes, only: [:create, :destroy]
    end
    resources :notebooks do
      resources :notes, only: [:create]
    end
    resources :tags
    resources :friend_requests, only: [:create] do
      post "accept", to: "friend_requests#accept"
      post "deny", to: "friend_requests#deny"
    end
    resources :friendships, only: [:destroy]
  end
  resource :session, only: [:create, :new, :destroy]
end