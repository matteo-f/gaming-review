Rails.application.routes.draw do
  root 'welcome#welcome'
  get '/homepage', to: 'welcome#homepage'

  resources :reviews do
    collection do
      get 'recent', to: 'reviews#recent_reviews'
    end
  end

  resources :games, :only => [:index, :new, :create, :show] do
    collection do
      get 'top', to: 'games#top_games'
    end
    resources :reviews, :only => [:show]
  end

  resources :users, :only => [:index, :new, :create, :show] do
    resources :reviews
  end

  get '/signin', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get 'reviewers/top_reviewers', to: 'users#top_reviewers'

  get '/auth/facebook/callback' => 'sessions#omniauth'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
