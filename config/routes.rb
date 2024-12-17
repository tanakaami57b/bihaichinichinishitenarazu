Rails.application.routes.draw do
  devise_for :users
  # deviseを使用するURLに「users」を含むという記述

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  resources :posts, only: %i[index new create show edit update destroy] do
    resources :comments, only: %i[create edit update destroy], shallow: true
    collection do
      get :bookmarks
  end
end
resources :bookmarks, only: %i[create destroy]
resource :profile, only: %i[show edit update]


  # Defines the root path route ("/")
  root 'static_pages#top'
end
