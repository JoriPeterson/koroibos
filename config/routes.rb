Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      namespace :olympians do
      end
      resources :olympians, only: [:index]
    end
  end
end
