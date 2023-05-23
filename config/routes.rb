Rails.application.routes.draw do
  resources :librarians
  resources :professors
  resources :students
  resources :faculties
  resources :groups
  resources :books
  resources :physical_books
  get 'home/index'
  get 'home/dashboard'
  devise_for :users
  root to: "home#index"
  resources :borrow_extensions
  resources :extension_reasons
  resources :borrows
  resources :book_links
  resources :publishers
  resources :authors
  resources :cards
  resources :users
  resources :permissions
  resources :roles
  resources :departments
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
