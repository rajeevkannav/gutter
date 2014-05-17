Gutter::Engine.routes.draw do
  root to: 'gutter#index'
  get 'fetch-data/:target' => 'gutter#fetch_data', :as => 'fetch_data'
end
