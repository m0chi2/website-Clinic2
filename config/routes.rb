Rails.application.routes.draw do

  devise_for :admins, module: "admins"

  devise_for :patients, controllers: {
    sessions:      'patients/sessions',
    passwords:     'patients/passwords',
    registrations: 'patients/registrations'
  }
  namespace :patients do
    get 'homes/reservation' => 'homes#reservation'
    resources :homes, only: [:index, :show]
  end

  resources :posts
  resource :pickadates, only: [:new, :create]
  resources :reservations, only: [:index, :new, :create]
  post 'reservations/new' => 'reservations#new'
  get 'reservations/confirm' => 'reservations#confirm'
  post 'reservations/confirm' => 'reservations#confirm'
  get 'reservations/thanks' => 'reservations#thanks'

  get '/' => 'homes#top'
  get '/about' => 'homes#about'
  get '/exams' => 'homes#exams'
  get '/access' => 'homes#access'

  get 'inquiry' => 'inquiry#index'
  get 'inquiry/confirm' => 'inquiry#confirm'
  post 'inquiry/thanks' => 'inquiry#thanks'
  get 'inquiry/thanks' => 'inquiry#thanks'

end
