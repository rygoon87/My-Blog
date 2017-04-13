Rails.application.routes.draw do

  get('/about', { to: 'about#index' })
  get('/contact', { to: 'contact#index' })


  resources :posts do
  resources :reviews, only: [:create, :destroy]
end


  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :edit] do
     delete :destroy, on: :collection
   end

  root "posts#index"
end
