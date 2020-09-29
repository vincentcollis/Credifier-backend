Rails.application.routes.draw do
  get '/posts/politics', to: 'posts#politics'
  get '/posts/sports', to: 'posts#sports'
  get '/posts/science', to: 'posts#science'

  resources :ratings
  resources :reviews
  resources :users
  resources :posts
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
