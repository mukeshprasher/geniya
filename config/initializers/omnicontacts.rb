require "omnicontacts"

Rails.application.middleware.use OmniContacts::Builder do
  importer :gmail, "351768923449-u963j49k8vjdg7960lub7q3v22vgittn.apps.googleusercontent.com", "S1TEvcdKXH9BL9eu806m7bNr", {:redirect_path => "/invites/gmail/contact_callback", :max_results => 1000}
  importer :yahoo, "consumer_id", "consumer_secret", {:callback_path => '/callback'}
  importer :hotmail, "client_id", "client_secret"
  importer :facebook, "1525309957687470", "adf1333680fef8c2cab6418ae06311bf"
end



