AppTkbb::Application.routes.draw do
  resources :placements do
    get :search, :on => :collection
  end

  root :to => "welcome#index"
  post "comment" => "welcome#comment"
  
  match "/auth/:provider/callback" => "sessions#create"
  match "/signout" => "sessions#destroy", :as => :signout
end
