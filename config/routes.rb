Rails.application.routes.draw do
  resources :institutions do
    resources :locations
    resources :specialities
  end

  resources :patients
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
