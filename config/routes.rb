# config/routes.rb
Rails.application.routes.draw do
  resources :users do
    resources :animes
  end
  resources :animes

  post 'auth/login', to: 'authentication#authenticate'

  post 'signup', to: 'users#create'

end
