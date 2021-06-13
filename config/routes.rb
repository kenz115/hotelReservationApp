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
  get '/users/sign_in', to: 'sessions#new'
  post '/users/sign_in', to: 'sessions#create'
end
