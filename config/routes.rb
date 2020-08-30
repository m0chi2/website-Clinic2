Rails.application.routes.draw do
  devise_for :patients, controllers: {
    sessions: 'patients/sessions',
    passwords: 'patients/passwords',
    registrations: 'patients/registrations',
  }

  namespace :patients do
    get 'homes/reservation' => 'homes#reservation'
    resources :homes, only: [:index, :show]
  end

  namespace :admins do
    resources :reservations, only: [:index, :new, :create, :destroy]
    get 'reservations/all' => 'reservations#all'
    get 'reservations/today' => 'reservations#today'
    get 'reservations/confirm' => 'reservations#confirm'
    get 'reservations/testpage' => 'reservations#testpage'
    get '/' => 'homes#top'
    get '/about' => 'homes#about'
    get 'homes/patients' => 'homes#patients'
    get 'homes/:id/patient' => 'homes#patient', as: "homes_patient"
  end

  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations',
  }
  # 使用するコントローラをapp/contorolers/admins内のものにする

  resources :reservations, only: [:index, :new, :create]
  post 'reservations/new' => 'reservations#new'
  get 'reservations/confirm' => 'reservations#confirm'
  post 'reservations/confirm' => 'reservations#confirm'
  get 'reservations/thanks' => 'reservations#thanks'

  resources :posts
  resource :pickadates, only: [:new, :create]

  get '/' => 'homes#top'
  get '/about' => 'homes#about'
  get '/exams' => 'homes#exams'
  get '/access' => 'homes#access'

  get 'inquiry' => 'inquiry#index'
  get 'inquiry/confirm' => 'inquiry#confirm'
  post 'inquiry/thanks' => 'inquiry#thanks'
  get 'inquiry/thanks' => 'inquiry#thanks'
end
