Rails.application.routes.draw do
  root "projects#index"

  namespace :admin do
    root "projects#index"
  end
end
