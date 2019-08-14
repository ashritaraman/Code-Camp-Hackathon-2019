Rails.application.routes.draw do
  resources :places do
    resources :ally_places
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
