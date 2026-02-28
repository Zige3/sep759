Rails.application.routes.draw do
  root "countries#index"
  get "/details", to: "countries#details", as: :details
end