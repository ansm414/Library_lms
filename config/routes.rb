Rails.application.routes.draw do
  root 'home#index'
  
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  get "togglebooks",to:"readers/books#searchbook"
  namespace :admins do
    resources :admins
    resources :categories
    resources :books
    resources :requested_books
    resources :issued_books
    resources :fines, only: [:index]
    get "savedata/:id", to: "issued_books#savebook"
    get "rejectdata/:id", to: "issued_books#rejectbook"
    get "available", to: "books#availablebooks"
    get "unavailable", to: "books#unavailablebooks"
    get "pending", to: "requested_books#pendingbooks"
    get "rejected", to: "requested_books#rejectedbooks"
    get "returnedbooks", to: "issued_books#returnedbooks"

    
    get "paidfines", to:"fines#paidfines"
    get "unpaidfines", to:"fines#unpaidfines"

  end

  namespace :readers do
    resources :books, only: [:index, :show]
    resources :requested_books
    resources :issued_books
    resources :fines, only: [:index]
    resources :ratings, only: [:create]
    resources :top_rated_books
    resources :ratings
    get "savedata/:id", to: "requested_books#savebook"
    get "returnbook/:id", to: 'returned_books#returnbook'
    get "available", to: "books#availablebooks"
    get "unavailable", to: "books#unavailablebooks"
    get "pending", to: "requested_books#pendingbooks"
    get "rejected", to: "requested_books#rejectedbooks"
    get "returnedbooks", to: "issued_books#returnedbooks"
    get "payfine/:id", to: "fines#payfine"

    get "paidfines", to:"fines#paidfines"
    get "unpaidfines", to:"fines#unpaidfines"


  end
  
end