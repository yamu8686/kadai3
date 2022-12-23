Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get "homes/about" => "homes#about",as: "about"
 # get "users/sign_up" => "users#sign_up",as: "sign_up"
 # get "users/sign_in" => "users#sign_in",as: "sign_in"
  resources :books, only: [:edit, :create, :index, :show, :detroy, :update]
  resources :users, only: [:index, :show, :edit, :update, :destroy]
 # resources :sessions, only: [:new, :create, :destroy]
end
