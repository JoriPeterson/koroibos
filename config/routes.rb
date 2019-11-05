Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :olympians, only: [:index]
      resources :olympian_stats, only: [:index]
      resources :events, only: [:index] do
        resources :medalists, only: [:index]
      end
    end
  end
end
