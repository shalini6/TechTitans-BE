Rails.application.routes.draw do
  resources :institutions do
  	get '/history' , to: 'institutions#history'
    resources :locations
    resources :clinicals
  end
  resources :appointments

  resources :patients do
  	get '/appointments', to: 'patients#appointment'
  end

 resources :timeslots
 resources :rates
<<<<<<< HEAD
 resources :patients
 resources :videos
=======
  
>>>>>>> d2304d56da8fce0ca16e8c77c78dde252ef6391b
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
