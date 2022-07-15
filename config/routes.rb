# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
  root "users#index"

  get 'users/:user_id/posts' => 'posts#index', as: :user_profile
  get 'users/:user_id/posts/:id' => 'posts#show', as: :user_profiles
  get 'users' => 'users#index'
  get 'users/:id' => 'users#show'
end
