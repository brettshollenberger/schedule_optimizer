SchedulingOptimizer::Application.routes.draw do
  resources :schedules do
    resources :projects
  end
  root to: 'schedules#index'
end
