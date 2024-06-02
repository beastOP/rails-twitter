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

  # set root route
  root 'home#index'
  get '/profile' => 'profile#index'
  get '/profile/edit' => 'profile#edit'

  get 'up' => 'rails/health#show', as: :rails_health_check
end
