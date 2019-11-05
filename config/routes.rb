Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :olympians, only: [:index]
      resources :olympian_stats, only: [:index]
      resources :events, only: [:index]
      namespace :olympians do
        get '/find', to: 'find#show'
        get '/find_all', to: 'find#index'
      end
    end
  end
end
