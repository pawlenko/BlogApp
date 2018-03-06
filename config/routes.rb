Rails.application.routes.draw do
  
  devise_for :users
  resources :categories
 
  
  resources :articles do
    resources :comments
  end

  resources :comments do
    resources :comments
  end


  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
