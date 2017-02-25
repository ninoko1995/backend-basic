Rails.application.routes.draw do
  root 'books#index'
  resources :books,only:[:create,:new,:edit,:update,:show,:destroy]
end
