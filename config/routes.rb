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

 
 resources :videos

end
