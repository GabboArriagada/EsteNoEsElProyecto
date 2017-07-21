RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  config.authorize_with do
    unless current_user.has_role? :admin
      redirect_to main_app.root_path
      flash[:alert] = "No estas autorizado para realizar está acción."
    end
  end

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete

    ## With an audit adapter, you can add:
    history_index
    history_show
  end

  ## visibility and order
  config.model 'User' do
    edit do
      exclude_fields :confirmation_token, :unlock_token, :unconfirmed_email, :failed_attempts, :confirmation_sent_at, :last_sign_in_ip, :last_sign_in_at, :current_sign_in_ip, :current_sign_in_at, :reset_password_sent_at, :remember_created_at
    end
  end
end
