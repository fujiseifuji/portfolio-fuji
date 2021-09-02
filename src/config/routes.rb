# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users,
             controllers: { registrations: 'registrations' }
  root 'posts#index'
  resources :users
  resources :posts, only: %i(index new create show destroy) do
    resources :photos, only: %i(create)
  end
end
