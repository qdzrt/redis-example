Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'articles#index'

  resources :articles do
    collection do
      get 'search'
    end
  end

  namespace :ajax, defaults: { format: :json } do
    namespace :articles do
      get 'search'
    end
  end

end
