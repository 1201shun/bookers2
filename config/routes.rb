Rails.application.routes.draw do
root :to => 'homes#top'
devise_for :users
resources :users, only: [:index, :show, :edit, :update]
resources :books
get 'book' => 'books#create'
post 'books' => 'books#create'
get 'home/about'=> 'homes#about'
delete 'books/:id' => 'books#destroy', as: 'destroy_book'
end
