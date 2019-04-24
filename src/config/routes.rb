Rails.application.routes.draw do
  resources :report_groups
  devise_for :users
  root to: 'home#index'

  resources :reports
  get 'home/about'
  get 'home/index'
  post '/report_groups/redo_groups'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
