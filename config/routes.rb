Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :feeds, only: [:show]
      resources :tweets, only: [:create]
    end
  end

  mount ActionCable.server => '/cable'
end
