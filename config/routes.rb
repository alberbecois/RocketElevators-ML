Rails.application.routes.draw do
  devise_for :users, path: '', protocol: "https", path_names: { sign_in: 'login', sign_out: 'logout' }
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'pages#index'

  
  authenticate :user do
    resources :interventions
  end

  resources :quotes
  resources :leads
  post "/recognition/enrollment" => "recognition#enrollment"
  post "/recognition/create_profile" => "recognition#create_profile"
  get "/recognition/get_profiles" => "recognition#get_profiles"
  post "/recognition/identification" => "recognition#identification"
  post "/recognition/speech_to_text" => "recognition#speech_to_text"
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
