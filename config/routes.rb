Library::Application.routes.draw do
  devise_for :users
 # resources :books do
  #	get 'page/:page', :action => :index, :on => :collection

  	resources :books
  
#get "/books" => "books#index", as: 'books'
#get "/books/new" => "books#new", as: 'new_book'
#get "/books/:id" => "books#show", as: 'book'
#post "/books" => "books#create"
#get "/books/:id/edit" => "books#edit", as: 'edit_book'
#patch "/books/:id" => "books#update"
#delete "/books/:id" => "books#destroy"

get "/users" => "users#index", as: 'users'

root 'books#index'
end
