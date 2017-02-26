Rails.application.routes.draw do
  devise_for :users
  resources :users,only:[:show,:index,:edit,:update]
  root 'home#top'
  resources :books,only:[:index,:create,:edit,:update,:show,:destroy]
end
