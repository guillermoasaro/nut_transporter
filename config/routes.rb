Rails.application.routes.draw do
  get 'transport/index'
  post 'transport/calculate_max_nuts'

  root to: 'transport#index'
end
