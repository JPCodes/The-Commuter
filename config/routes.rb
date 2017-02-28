Rails.application.routes.draw do
  root to: 'pages#index'
  resources :pages, :only => [:index]
  get '/congressional-report', to: 'pages#congressional_report'
end
