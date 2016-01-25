Rails.application.routes.draw do
  
  root 'users#index'
  resources :users
  mount Split::Dashboard, at: 'split'

end
