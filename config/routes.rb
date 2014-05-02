BetterNote::Application.routes.draw do
  root to: "static_pages#root"
  resources :users, only: [:create, :new, :show, :index]# do
  #   resources :friend_requests, only: [:create] do
  #     post "accept", to: "friend_requests#accept"
  #     post "deny", to: "friend_requests#deny"
  #   end
  #   resources :friendships, only: [:destroy]
  # end
  # resources :likes, only: [:destroy]
  # resources :notes, only: [:index, :show, :edit, :update, :destroy] do
  #   resources :comments, only: [:create]
  #   resources :likes, only: [:create]
  # end
  # resources :comments, only: [:destroy]
  # resources :tags
  # resources :notebooks do
  #   resources :notes, only: [:create]
  # end
  resource :session, only: [:create, :new, :destroy]
  namespace :api, defaults: { format: :json } do
    resources :notes, only: [:create, :show, :index, :update, :destroy]
    resources :notebooks, only: [:create, :show, :index, :update, :destroy]
    resources :tags, only: [:index, :create, :update, :destroy]
    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
    resources :note_tags, only: [:create, :destroy]
  end
end