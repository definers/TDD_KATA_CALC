Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/calculate_sum', to: "string_calculators#sum_numbers"
end
