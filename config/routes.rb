Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :crate, :destroy]
      resources :todos

      # fetch to custom Todo route for specific user
      get '/user_todos/:id' => 'todos#user_todos'

      # sessions CSRF-TOKEN route
      get '/auth_check' => 'sessions#auth_check'

      # /signup is my post fetch request route for signing up new user to users#create action
      post '/signup' => 'users#create'

      # /login is my post fetch requeset route for logging in existing user to sessions#create action
      post '/login' => 'sessions#create'

      # /current_user endpoint for a fetch on refresh in App.js, to persist User on refresh
      get '/current_user' => 'users#current_user'

      # /logout is my post fetch request route for logging out of existing user's session, sessions#destroy
      delete "/logout" => "sessions#destroy"
    end
  end
end
