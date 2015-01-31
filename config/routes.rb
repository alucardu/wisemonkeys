Wisemonkeys::Application.routes.draw do
  get "competitions/votepage"
  resources :businessrequests
  resources :reviews
  get "users/new"
  resources :competitions do
    get :votepage, on: :member
    post :submit_vote, on: :member
  end
  resources :users 
  get 'pictures/new'
  get 'competitions/new'
  resources :pictures do
    member do
      get 'upvote'
    end
    collection { post :sort }
  end
  get '/mypictures' => 'pictures#mypictures'
  get '/homepage' => 'competitions#homepage'
  get '/voteresults' => 'pictures#voteresults'
  get '/vote' => 'competitions#votepage'
  root 'competitions#homepage'
  resources :sessions, only: [:new, :create, :destroy]
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
end
