Rails.application.routes.draw do
  root 'home#index'

  devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations',
      passwords: 'users/passwords',
      omniauth_callbacks: 'users/omniauth_callbacks'
  }
  resources :users, param: :uuid, only: %i[index show]
  resources :teams, param: :uid
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
