Rails.application.routes.draw do
  resources :survivors
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   
  get :infected, to: 'reports#infected'
  get :noninfected, to: 'reports#non_infected'
 
end
