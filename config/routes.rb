Rails.application.routes.draw do
  root 'home#top'
  resources :books,only:[:index,:create,:edit,:update,:show,:destroy]
end
