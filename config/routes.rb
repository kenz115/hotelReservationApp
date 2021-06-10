Rails.application.routes.draw do
  root 'static_pages#home'
  resources :rooms do
    collection do
      get 'search'
    end
  end
end
