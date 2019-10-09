Rails.application.routes.draw do
  resources :comments
  resources :posts

  root "posts#index"
end
