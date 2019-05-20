# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :grade_records, only: %i[new index create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
