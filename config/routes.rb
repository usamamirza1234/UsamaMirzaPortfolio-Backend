Rails.application.routes.draw do
  root 'welcome#index'
  get "/s", to: "welcome#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      devise_scope :user do
        post "sign_up", to: "registrations#create"
        post "sign_in", to: "sessions#create"
      end
      resources :blogs

    end
  end
end
