# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users,
             controllers: { registrations: 'registrations' }
  root 'posts#index'
  get  'pages/about' => 'pages#about'
  get  'pages/terms' => 'pages#terms'
  get  'pages/policy' => 'pages#policy'
  resources :users
  resources :posts, only: %i[index new create show destroy] do
    resources :photos, only: %i[create]
    resources :maps, only: %i[create]
    resources :likes, only: %i[create destroy]
    resources :comments, only: %i[create destroy]
  end
end
