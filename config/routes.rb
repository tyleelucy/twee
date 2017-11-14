Rails.application.routes.draw do

  get 'now_following' => 'epicenter#now_following'
  get 'show_user' => 'epicenter#show_user'
  get 'tag_tweets' => 'epicenter#tag_tweets'
  get 'unfollow' => 'epicenter#unfollow'
  get 'all_users' => 'epicenter#all_users'
  
  resources :tweets
  devise_for :users

  root 'epicenter#feed' 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
