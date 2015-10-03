Rails.application.routes.draw do
  post 'tropo/inbound'
  post 'tropo/save_recording'
  root to: 'visitors#index'
  devise_for :users
  resources :callers
  resources :conferences
  resources :keywords
end
