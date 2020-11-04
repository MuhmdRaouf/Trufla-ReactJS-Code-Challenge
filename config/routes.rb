Rails.application.routes.draw do
  root to: 'homepage#index', as: 'root', via: :get

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
