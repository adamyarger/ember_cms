Rails.application.routes.draw do
  root 'ember#bootstrap'
  

  namespace :api do
  	namespace :v1 do
  		resources :leads
  	end
  end

  get '/*path' => 'ember#bootstrap'
end