Rails.application.routes.draw do

  devise_for :users
  resources :users,only: [:show,:index,:edit,:update] do
    member do
      get :follow
      get :followers
    end
  end

  resources :books do
  	resource :favorites, only: [:create, :destroy]
  	resources :post_comments, only: [:create, :destroy]
  end

  root 'home#top'
  get 'home/about' => 'home#about'

  post 'follow/:id' => 'relationships#follow', as: 'follow' # フォローする
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す

end