Rails.configuration.stripe = {
  :publishable_key => ENV['PUBLISHABLE_KEY'],
  :secret_key      => ENV['SECRET_KEY']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
StripeEvent.authentication_secret = ENV['STRIPE_WEBHOOK_SECRET']
StripeEvent.authentication_secret = Rails.application.secrets.stripe_webhook_secret
