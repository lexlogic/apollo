ActiveAdmin.setup do |config|
  config.site_title = "Apollo"
  config.site_title_image = "logo_light.png"
  config.authentication_method = :authenticate_user!
  config.current_user_method   = :current_user
  config.logout_link_path      = :destroy_user_session_path
  config.logout_link_method    = :delete
  config.batch_actions = false
  config.localize_format = :long
  config.authorization_adapter = ActiveAdmin::CanCanAdapter
  config.on_unauthorized_access = :access_denied
  config.default_namespace = false
  config.breadcrumb = Proc.new{ [] }
  config.comments_menu = false
  config.root_to = 'dashboard#index'
end
