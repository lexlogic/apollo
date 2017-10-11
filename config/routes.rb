Rails.application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  match "/checkin" => 'parts#checkin', via: :post
end
