Rails.application.routes.draw do
  
  devise_for :users
  resources :brands
  resources :activities
    resources :followers
    resources :followings
    
  get '/@:friendly_id', to: 'users#show', as: 'user'
    
  resources :explore
    resources :categories
  
  resources :users do
        resources :avatars
    member do
      get :follow
      get :unfollow
      post :follow 
      post :unfollow 
   end
end

  resources :reviews do    
    resources :comments
    resources :photos
    member do
        put "like", to: "reviews#like"
        put "dislike", to: "reviews#dislike"
    end
end

  get "search", to: "search#search"
  
  get "/pages/:page" => "pages#show"

  root "reviews#index"
end
