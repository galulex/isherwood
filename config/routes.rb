Rails.application.routes.draw do
  
  devise_for :users
  resources :brands
  resources :activities
    
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

  get "search", to: "search#search"
  get 'search/typeahead/:term' => 'search#typeahead'
  
  get "/pages/:page" => "pages#show"

  root "reviews#index"
end
