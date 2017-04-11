Rails.application.routes.draw do

  get('/about', { to: 'about#index' })
  get('/contact', { to: 'contact#index' })
  get('home/:id', { to: 'home#show', as: 'home_show'})

  resources :posts
  

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create,] do
     delete :destroy, on: :collection
   end

  root "home#index"
end
