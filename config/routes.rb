Rails.application.routes.draw do

  resources :post do
  end

  root "home#index"
end
