Rails.application.routes.draw do
  # News
  root to: 'news#index'
  resources :news, :only => [:index]
  get '/congressional-report', to: 'news#congressional_report'
  get 'article', to: 'news#show_article', as: 'show_article'
  get 'download/article', to: 'news#download_pdf', as: 'download_pdf'
  # Business
  resources :businesses, :only => [:index]
  post '/businesses', to: 'businesses#find_businesses'
end
