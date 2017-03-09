Rails.application.routes.draw do
  # OmniAuth
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  resources :sessions, only: [:create, :destroy]
  # News
  root to: 'news#index'
  resources :news, :only => [:index]
  get '/congressional-report', to: 'news#congressional_report'
  get 'article', to: 'news#show_article', as: 'show_article'
  get 'download/article', to: 'news#download_pdf', as: 'download_pdf'
  # Business
  resources :businesses, :only => [:index]
  post '/businesses', to: 'businesses#find_businesses'
  # Uber
  resources :ubers, :only => [:index]
  # Conversations
  resources :conversations do
    resources :responses, :except => [:index, :show]
  end
end
