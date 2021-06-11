Rails.application.routes.draw do
  root 'static_pages#home'
  resources :rooms do
    collection do
      get 'search'
    end
  end
  get '/users/sign_up'
  get '/users/sign_in'
end
