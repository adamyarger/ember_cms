Rails.application.routes.draw do
  root 'ember#bootstrap'
  get '/*path' => 'ember#bootstrap'

  namespace :api do
  	namespace :v1 do
  		resources :leads
  	end
  end
end