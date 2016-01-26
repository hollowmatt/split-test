Rails.application.routes.draw do
  
  root 'users#index'
  resources :users

  #vanity routes
  get '/vanity' =>'vanity#index'
	get '/vanity/participant/:id' => 'vanity#participant'
	post '/vanity/complete'
	post '/vanity/chooses'
	post '/vanity/reset'
	post '/vanity/enable'
	post '/vanity/disable'
	post '/vanity/add_participant'
	get '/vanity/image'

end
