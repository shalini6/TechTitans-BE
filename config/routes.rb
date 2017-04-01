Rails.application.routes.draw do
  resources :institutions do
    resources :locations
    resources :clinicals
 end

 resources :timeslots
 resources :rates
 resources :patients
 resources :videos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
