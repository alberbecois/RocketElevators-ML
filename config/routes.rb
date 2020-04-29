Rails.application.routes.draw do
  devise_for :users, path: '', protocol: "https", path_names: { sign_in: 'login', sign_out: 'logout' }
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'pages#index'

  authenticate :user do
    resources :interventions
  end

  resources :quotes
  resources :leads
  post "recognition/upload" => "recognition#upload"
  post '/index' => "leads#create"
  post '/quotes' => "quotes#create"
  get '/recognition' => "recognition#index"
  get '/message' => "pages#message"
  get '/quotesconfirm' => "pages#quotesconfirm"
  get '/index' => "pages#index"
  get '/residential' => "pages#residential"
  get '/corporate' => "pages#corporate"
  get '/submissionform' => "quotes#submissionform"
  get '/privacy' => "pages#privacy"
  get '/pokemon' => "pages#pokemon"
  get '/404' => "pages#404"
  get '/tos' => "pages#tos"
  # get 'dropbox/auth' => 'dropbox#auth'
  # get 'dropbox/auth_callback' => 'dropbox#auth_callback'
end
