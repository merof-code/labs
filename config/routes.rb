Rails.application.routes.draw do
  resources :books
  devise_for :users
  get 'home/index'
  get 'home/dashboard'
  root to: "home#index"
  resources :users do
    collection do
      get 'search(/:id)', to: 'users#search', as: 'search'
    end
  end
  resources :physical_books do
    collection do
      get 'search(/:id)', to: 'physical_books#search', as: 'search'
    end
  end
  resources :librarians
  resources :professors
  resources :students
  resources :faculties
  resources :groups
  resources :borrow_extensions
  resources :extension_reasons
  resources :borrows
  resources :book_links
  resources :publishers
  resources :authors
  resources :cards
  resources :permissions
  resources :roles
  resources :departments
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
