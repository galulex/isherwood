Rails.application.routes.draw do

  post '/rate' => 'rater#create', :as => 'rate'
  get 'users/show'

  devise_for :users
  resources :brands
  
  resources :explore
    resources :categories
  
  resources :users do
    member do
      get :follow
      get :unfollow
      post :follow 
      post :unfollow 
   end
end

  delete 'delete_photo', to: "photos#delete_photo"
  delete 'delete_all', to: 'photos#delete_all'

  resources :reviews do    
    resources :comments
    resources :photos
    member do
        put "like", to: "reviews#like"
        put "dislike", to: "reviews#dislike"
    end
end
  
  get "/pages/:page" => "pages#show"

  root "reviews#index"
end
