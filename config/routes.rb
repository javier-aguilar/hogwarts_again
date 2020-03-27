Rails.application.routes.draw do

  get '/professors', to: 'professors#index'

  get '/professors/:id', to: 'professor_students#index'

  get 'students', to: 'students#index'

end
