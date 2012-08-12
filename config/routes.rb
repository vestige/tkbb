AppTkbb::Application.routes.draw do
  resources :gyms do
    get :search, :on => :collection
  end

  resources :climbings

  root :to => "welcome#index"
  post "comment" => "welcome#comment"
  
  get "/auth/:provider/callback" => "sessions#create", :as => :signin
  get "/signout" => "sessions#destroy", :as => :signout

end
