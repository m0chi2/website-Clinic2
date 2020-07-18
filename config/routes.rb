Rails.application.routes.draw do

  resources :reservations, only: [:index, :new, :create]
  post 'reservations/new' => 'reservations#new'
  get 'reservations/confirm' => 'reservations#confirm'
  post 'reservations/confirm' => 'reservations#confirm'
  get 'reservations/thanks' => 'reservations#thanks'

  resource :pickadates, only: [:new, :create]

  devise_for :admins, module: "admins"
 # 使用するコントローラをapp/contorolers/admins内のものにする
  devise_for :patients, module: "patients"

  get '/' => 'homes#top'
  get '/about' => 'homes#about'
  get '/exams' => 'homes#exams'
  get '/access' => 'homes#access'

  get 'inquiry/index' => 'inquiry#index'
  get 'inquiry/confirm' => 'inquiry#confirm'
  get 'inquiry/thanks' => 'inquiry#thanks'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
