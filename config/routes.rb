Library::Application.routes.draw do
  devise_for :users
 
 resources :reservations

 resources :books do
  #get 'page/:page', :action => :index, :on => :collection
  	collection do
  		get 'search'
  	end
  end

  	
  
post "/books/search" => "books#search_results", as: 'search'
#get "/books" => "books#index", as: 'books'
#get "/books/new" => "books#new", as: 'new_book'
#get "/books/:id" => "books#show", as: 'book'
#post "/books" => "books#create"
#get "/books/:id/edit" => "books#edit", as: 'edit_book'
#patch "/books/:id" => "books#update"
#delete "/books/:id" => "books#destroy"


get "/users/sign_up", as: 'users_sign'

get "/users" => "users#index", as: 'users'
get "/users/:id" => "users#show", as: 'user'
get "/users/:id/edit" => "users#edit", as: 'edit_user'
patch "/users/:id" => "users#update"
delete "/users/:id" => "users#destroy"

#get "/reservations" => "reservations#index", as: 'reservations'
#get "/reservations/new" => "reservations#new", as: 'new_reservation'
#get "/reservations/:id" => "reservations#show", as: 'reservation'
#post "/reservations" => "reservations#create"
#get "/reservations/:id/edit" => "reservations#edit", as: 'edit_reservation'
#patch "/reservations/:id" => "reservations#update"
#delete "/reservations/:id" => "reservations#destroy"

get "/overdue" => "reservations#overdue", as: 'overdue'




resources :authors

root 'books#index'

end
