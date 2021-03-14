Rails.application.routes.draw do
  devise_for :users
  root "projects#index"

  namespace :admin do
    resources: projects
    root "projects#index"
  end
end
