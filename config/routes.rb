Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # HomesController
  root to: "homes#top"

  #BooksController
  resources :books
end