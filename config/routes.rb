Rails.application.routes.draw do
  get 'submit_report/index'
  resources :reports

  root 'submit_report#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
