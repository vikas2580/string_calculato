Rails.application.routes.draw do
  post '/string_calculator', to: 'string_calculator#create'

  get "up" => "rails/health#show", as: :rails_health_check
end
