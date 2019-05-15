Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :feeds, only: [:index, :show, :create]
      resources :tweets, only: [:create, :destroy]
      mount ActionCable.server => '/cable'
    end
  end

end
