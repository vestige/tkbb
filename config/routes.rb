AppTkbb::Application.routes.draw do
  resources :gyms do
    get :search, :on => :collection
  end

  resources :climbings

  root :to => "welcome#index"
  post "comment" => "welcome#comment"
  
  match "/auth/:provider/callback" => "sessions#create"
  match "/signout" => "sessions#destroy", :as => :signout

  #TODO Delete!!
  namespace :backdoor do |backdoor|
    match :login
  end
end
