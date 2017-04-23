Rails.application.routes.draw do

  get('/about', { to: 'about#index' })
  get('/contact', { to: 'contact#index' })

  delete('/admin/reviews_delete/', { to: 'reviews#admin_destroy' })
  delete('/admin/users_delete/', { to: 'users#admin_destroy' })

  resources :posts do
  resources :reviews, only: [:create, :destroy]
  end


  resources :users, only: [:new, :create, :show, :edit, :destroy, :update]
  resources :sessions, only: [:new, :create, :edit] do
     delete :destroy, on: :collection
   end

   namespace :admin do
     resources :dashboard, only: [:index]
   end

  root "posts#index"
end
