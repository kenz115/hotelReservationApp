Rails.application.routes.draw do
  root 'static_pages#home'

  get 'sessions/new'
  
  resources :rooms do
    collection do
      get 'search'
      get 'posts'
    end
  end

  get '/users/sign_up', to: 'users#new'
  post '/users', to: 'users#create'
  get '/users/account', to: 'users#account'
  get '/users/edit', to: 'users#edit'
  get '/users/profile', to: 'users#profile'
  patch '/users/profile', to: 'users#update_profile'
  patch '/users/update', to: 'users#update'
  get '/users/sign_in', to: 'sessions#new'
  post '/users/sign_in', to: 'sessions#create'
  delete '/sign_out', to: 'sessions#destroy'

  resources :reservations
end
