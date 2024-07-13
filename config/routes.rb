Rails.application.routes.draw do
  devise_for :users, path: '/', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    sign_up: '',
    registration: 'register',
    edit: 'edit',
    cancel: 'cancel',
    confirmation: 'verification'
  }

  root 'home#index'

  resource :profile, only: %i[show edit update], controller: 'profile'
  resource :tweet, only: %i[new create], controller: 'tweet'

  get 'up' => 'rails/health#show', as: :rails_health_check
end
