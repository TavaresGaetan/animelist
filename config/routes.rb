# config/routes.rb
Rails.application.routes.draw do
      namespace 'api' do
        namespace 'v1' do
          resources :animes
          resources :users
          post 'auth/login', to: 'authentication#authenticate'
          post 'signup', to: 'users#create'
    end
  end
end
