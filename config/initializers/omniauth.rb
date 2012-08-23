Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'm7QR2UlhMErnyvq8lCEZw', 'oZtOO4OW0ytMCp7ih6Xb6DdlOONq3x0bBIVz5lH8'
  provider :google, '850711736908.apps.googleusercontent.com', 'bD-UeFG5JYHCHU4gnoWo1dDQ',:scope => 'https://www.googleapis.com/auth/userinfo.profile'
  provider :facebook, '213997495329172', '782dec84eb5b864e46b2f51fd41b7774'
end



# OmniAuth.config.full_host = "http://localhost:3000"
# Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :google, 'localhost:3000', 'bD-UeFG5JYHCHU4gnoWo1dDQ', :scope => 'https://mail.google.com/mail/feed/atom/' 
  # #provider :facebook, '213997495329172', '782dec84eb5b864e46b2f51fd41b7774',{:scope => 'publish_stream,offline_access,email'}#i
#   
  # #provider :google, '850711736908.apps.googleusercontent.com','bD-UeFG5JYHCHU4gnoWo1dDQ'
# end