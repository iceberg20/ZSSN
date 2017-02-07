Rails.application.routes.draw do
  resources :inventories
  resources :survivors
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   
  get :infected, to: 'reports#infected'
  get :non_infected, to: 'reports#non_infected'
  #patch :report_infection, to: 'reports#report_infection'

  get 'report_infection/:id' => 'reports#report_infection'
  get 'update_location/:id/:lat/:long' => 'survivors#update_location'
  get 'avg_resourses' => 'reports#avg_resourses'

  post '/trade', to: 'trade#trade' 
end
