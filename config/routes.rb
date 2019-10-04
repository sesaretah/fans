Rails.application.routes.draw do

  devise_for :users
  api_version(:module => "V1", :path => {:value => "v1"}) do
    put '/profiles', to: 'profiles#update'
    get '/profiles/my', to: 'profiles#my'

    get '/transactions/in', to: 'transactions#in'
    get '/transactions/out', to: 'transactions#out'

    resources :profiles
    resources :posts
    resources :transactions


    post '/friendships', to: 'friendships#create'
    delete '/friendships', to: 'friendships#destroy'
    get '/friendships/accept', to: 'friendships#accept'
    get '/friendships/reject', to: 'friendships#reject'

    post '/wallets/charge', to: 'wallets#charge'

    post '/users/login', to: 'users#login'
    post '/users/sign_up', to: 'users#sign_up'
  end
end
Rails.application.routes.default_url_options[:host] = ""
