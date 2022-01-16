Rails.application.routes.draw do
devise_for :users
resources :users, only: [:index, :show, :edit, :update]
resources :books
root :to => 'homes#top'
get 'book' => 'books#create'
post 'books' => 'books#create'
get 'home/about'=> 'homes#about'
get 'users' => 'users#index'
delete 'books/:id' => 'books#destroy', as: 'destroy_book'
end
