RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)
  config.current_user_method(&:admin_user)
  config.excluded_models = ["Like", "Follow", "Mention", "Message", "Conversation", "Activity", "DevelopmentLog", "Rate", "RatingCache", "Response", "Relationship", "Share", "PaymentSubscription", "Payment", "Chat", "FeedbackReply", "Connection", "Category"]

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
    import

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

#  RailsAdminImport.config do |config| 
#    config.model 'User'.constantize do
#      excluded_fields do
#        #[:field1, :field2, :field3]
#      end
#      label :name
#      extra_fields do
#        #[:field3, :field4, :field5]
#      end
#    end
#  end
end
