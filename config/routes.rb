Rails.application.routes.draw do
  devise_for :users
  root 'home#top'
  resources :books,only:[:index,:create,:edit,:update,:show,:destroy]
end
