Rails.application.routes.draw do

  namespace :admins do
    get 'reservations/all'
  end
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }

 # 使用するコントローラをapp/contorolers/admins内のものにする

  devise_for :patients, controllers: {
    sessions:      'patients/sessions',
    passwords:     'patients/passwords',
    registrations: 'patients/registrations'
  }

  namespace :admins do
    resources :reservations, only: [:index, :new, :create, :destroy]
      get 'reservations/all' => 'reservations#all'
      get 'reservations/today' => 'reservations#today'
      get 'reservations/confirm' => 'reservations#confirm'
      get 'reservations/search' => 'reservations#search'
      get '/' => 'homes#top'
      get '/about' => 'homes#about'
  end

  get '/' => 'homes#top'
  get '/about' => 'homes#about'
  get '/exams' => 'homes#exams'
  get '/access' => 'homes#access'


  resources :reservations, only: [:index, :new, :create]
  post 'reservations/new' => 'reservations#new'
  get 'reservations/confirm' => 'reservations#confirm'
  post 'reservations/confirm' => 'reservations#confirm'
  get 'reservations/thanks' => 'reservations#thanks'

  resource :pickadates, only: [:new, :create]


end
