Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'books#index'
  resources :books,only:[:index, :show] #8個路徑 對到 7個方法



  namespace :admin do
    root 'books#index'
    resources :books #8個路徑 對到 7個方法
    resources :publishers #8個路徑 對到 7個方法
  end
end
