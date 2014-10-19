Library::Application.routes.draw do
  devise_for :users
 resources :books do
  get 'page/:page', :action => :index, :on => :collection
end

  	
  
#get "/books" => "books#index", as: 'books'
#get "/books/new" => "books#new", as: 'new_book'
#get "/books/:id" => "books#show", as: 'book'
#post "/books" => "books#create"
#get "/books/:id/edit" => "books#edit", as: 'edit_book'
#patch "/books/:id" => "books#update"
#delete "/books/:id" => "books#destroy"

get "/users" => "users#index", as: 'users'

get "/reservations" => "reservations#index", as: 'reservations'
get "/reservations/new" => "reservations#new", as: 'new_reservation'
get "/reservations/:id" => "reservations#show", as: 'reservation'
post "/reservations" => "reservations#create"
get "/reservations/:id/edit" => "reservations#edit", as: 'edit_reservation'
patch "/reservations/:id" => "reservations#update"
delete "/reservations/:id" => "reservations#destroy"

root 'books#index'
end
