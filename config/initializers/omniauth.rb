OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '295660457235598', 'a0ca12fb9897f2458c2742c932ab516d', display: "page", scope: "email,user_hometown,user_location,user_relationships,user_about_me"
end
