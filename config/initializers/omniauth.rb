OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '534918226549504', 'ddedba9522f3f2d83c22d4382d0c5534'
  provider :twitter, 'ljbhdBR1dqMLnmkRLCjCuQ', 'cRVq03JkNNfQPM9YU2LAX5qcuPcsRIPOm4otZzFg'
end	