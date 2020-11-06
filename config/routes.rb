Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :departments, only: [:index,:show]
      resources :products,    only: [:index,:show]
      resources :promotions,  only: [:index,:show]
      resources :dashboard,   only: [:index]
    end
  end

  root to: 'homepage#index', as: 'root', via: :get
  get '/*path' => 'homepage#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
