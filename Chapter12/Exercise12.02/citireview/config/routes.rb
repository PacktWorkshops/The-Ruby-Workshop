Rails.application.routes.draw do
  
  devise_for :users
  root 'home#index'

resources :reviews do
  resources :comments
end

end
