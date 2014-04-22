BetterNote::Application.routes.draw do
  resources :users, only: [:create, :new, :show] do
    resources :notes, only: [:index, :show, :edit, :update, :destroy] do
      resources :comments, only: [:new, :create, :destroy]
    end
    resources :notebooks do
      resources :notes, only: [:create]
    end
    resources :tags
  end
  resource :session, only: [:create, :new, :destroy]
end
