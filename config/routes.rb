Rails.application.routes.draw do

	resources :contact

	resources :workshops do
  		resources :bookings
  	end

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

	get 'bookings/:id/braintree/new' => "braintree#new", as: 'braintree_new'
	post 'bookings/:id/braintree/checkout' => "braintree#checkout", as: 'braintree_checkout'

	get '/search' => 'workshops#search', as: "search"
end
