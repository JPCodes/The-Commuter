Rails.application.routes.draw do
  root to: 'pages#index'
  resources :pages, :only => [:index]
  get '/congressional-report', to: 'pages#congressional_report'

  get 'article', to: 'pages#show_article', as: 'show_article'
  get 'download/article', to: 'pages#download_pdf', as: 'download_pdf'
end
