require 'resque/server'

Rails.application.routes.draw do
  # API for Ember
  namespace :api do
    resources :courses, only: :index
  end

  root 'pages#index'

  resources :series

  resources :hours

  # resources :courses

  resources :teaching_assistants

  resources :sessions, only: [:new, :create, :destroy]

  resources :statuses, only: [:index, :show]

  get '/sign_ups/forgot', to: 'sign_ups#forgot', as: 'forgot_sign_ups'
  get '/sign_ups/:private_id', to: 'sign_ups#show', as: 'sign_ups'
  get '/admins/dashboard', to: 'admins#dashboard', as: 'admins_dashboard'
  get '/emails/welcome', to: 'emails#welcome', as: 'welcome_emails'
  get '/emails/monthly', to: 'emails#monthly', as: 'monthly_emails'
  get '/emails/confirmation', to: 'emails#confirmation', as: 'confirmation_emails'
  get '/emails/forgot', to: 'emails#forgot', as: 'forgot_emails'

  mount Resque::Server.new, :at => "/resque"
end
