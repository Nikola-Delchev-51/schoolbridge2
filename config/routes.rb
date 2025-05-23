Rails.application.routes.draw do
  devise_for :people, controllers: { registrations: "people/registrations" }
  resources :people, except: [:show]
  resources :plagiarism_reports
  resources :assignment_submissions
  resources :assignments
  resources :subjects
  resources :class_cohorts
  resources :addresses
  resources :class_grades
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  post "copyleaks/webhook/scan/:scan_id/:status", to: "copyleaks#webhook", as: :copyleaks_webhook

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "assignments#index"
end
