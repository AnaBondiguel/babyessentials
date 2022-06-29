Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, "350403583939211", "b630a460b03d145a69afb0e3f09c6ac5"
  end