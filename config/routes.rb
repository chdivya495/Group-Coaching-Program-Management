# frozen_string_literal: true

Rails.application.routes.draw do
  root 'companies#index'

  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  get 'up' => 'rails/health#show', as: :rails_health_check

  resources :companies do
    resources :employees
  end

  resources :coaching_programs do
    member do
      get 'coaches'
    end
    collection do
      get 'search'
    end
  end

  resources :coaches do
    collection do
      get 'dashboard'
      get 'get_coach_details'
    end
  end
end
