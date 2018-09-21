Rails.application.routes.draw do

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

	# get 'reservations/:id/payments/new' => "payments#new", as: 'new_payment'
	# post 'reservations/:id/payments/checkout' => "payments#checkout", as: 'payment_checkout'

	# get '/search' => 'workshops#search', as: "search"
end
