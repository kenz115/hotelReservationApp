Rails.application.routes.draw do
  get 'sessions/new'
  root 'static_pages#home'
  resources :rooms do
    collection do
      get 'search'
    end
  end
  get '/users/sign_up', to: 'users#new'
  post '/users',   to: 'users#create'
  get '/users/account', to: 'users#account'
  get '/users/sign_in', to: 'sessions#new'
  post '/users/sign_in', to: 'sessions#create'
  delete '/sign_out', to: 'sessions#destroy'
end
