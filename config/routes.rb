Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'artworks#index', as: 'home'
  post 'xulylogin' => 'users#xulylogin'
  get 'login' => 'users#login'
  resources :users
  resources :artworks
  resources :categories
  
  post 'artworks/:id/download', to: 'artworks#download', as: 'download'
  
  resources :users do
    resources :artworks do
      resources :favorites
    end
  end
end
