Forsquare::Application.routes.draw do

  root :to => "sessions#new"

  resource :session do
    collection do
      get 'callback'
    end
  end

  resources :foursquare, only: [:index] do
    collection do
      get 'profile_user'
      get 'search_user'
      get 'search_venues'
      get 'search_friends'      
      get 'search_tips'
    end
  end  

end
