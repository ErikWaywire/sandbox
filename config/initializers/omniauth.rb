OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  if Rails.env.production?
  	provider :facebook, '528803847177512', 'ea1aafd66618c9032f4467d8b4684522', :scope => 'email,publish_actions'
  else
  	provider :facebook, '534918226549504', 'ddedba9522f3f2d83c22d4382d0c5534', :scope => 'email,publish_actions'
  end
  provider :twitter, 'ljbhdBR1dqMLnmkRLCjCuQ', 'cRVq03JkNNfQPM9YU2LAX5qcuPcsRIPOm4otZzFg'
end	