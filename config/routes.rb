# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :mentors, controllers: { omniauth_callbacks: 'mentors/omniauth_callbacks' }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :grade_records, only: %i[new create]
  root to: 'home#index'
end
