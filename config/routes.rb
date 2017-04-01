Rails.application.routes.draw do
  resources :institutions do
    resources :locations
    resources :clinicals
 end

 resources :timeslots

 resources :patients
 get 'search/institutions', to: 'search#institutions'
 get 'search/doctors', to: 'search#doctors'
 get 'search/services', to: 'search#services'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
