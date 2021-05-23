Rails.application.routes.draw do
  devise_for :users
  root "articles#index"
  

  resources :articles do
    resources :comments
    collection do
      get '/archived', to: 'articles#archived'
    end
  end

end