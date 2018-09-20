Rails.application.routes.draw do
	# get 'login', to: 'sessions#new'
	# get 'logout', to: 'sessions#destroy'
	# get 'sessions/new'
	# get 'sessions/create'
	# get 'sessions/destroy'
	# resources :users

	get '/register' => 'users#new'
	post '/users' => 'users#create'

	get '/signin' => 'sessions#new'
	post '/signin' => 'sessions#create'
	delete '/signout' => 'sessions#destroy'

	resources :sessions, only: [:create]
	resources :users, only: [:new, :create, :show, :edit]

	get "/auth/:provider/callback" => "sessions#create_from_omniauth"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
