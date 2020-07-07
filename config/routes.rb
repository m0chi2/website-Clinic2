Rails.application.routes.draw do
  resources :reservations, only: [:index, :new, :create]
  get 'reservations/confirm' => 'reservations#confirm'
  get 'reservations/thanks' => 'reservations#thanks'

  devise_for :admins
  devise_for :patients

  get '/' => 'homes#top'
  get '/about' => 'homes#about'
  get '/exams' => 'homes#exams'
  get '/access' => 'homes#access'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
