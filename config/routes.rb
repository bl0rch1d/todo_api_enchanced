Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :auth do
        resource :sessions, except: :show
        resource :registrations, only: :create
      end

      resources :projects do
        resources :tasks, shallow: true do

          scope module: :tasks do
            resources :comments

            resource :completions, only: :update
            resource :prioritizations, only: :update
          end
        end
      end
    end
  end

  root 'pages#index'
end
