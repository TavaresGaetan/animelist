# config/routes.rb
Rails.application.routes.draw do
  resources :users do
    resources :animes
  end
  resources :animes
end
