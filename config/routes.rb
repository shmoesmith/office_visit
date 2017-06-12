Rails.application.routes.draw do


root 'doctors#index'

resources :doctors
resources :patients
resources :appointments, only: [:new, :create]
delete "/doctor/:doctor_id/appointment/:id", to: "appointments#destroy", as: "appointment"
end