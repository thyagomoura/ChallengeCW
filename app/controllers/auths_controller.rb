class AuthsController < ApplicationController
    def create
        hmac_secret = Rails.application.credentials.dig(:JWT, :private_key)
        payload = { name: params[:name], exp: Time.now.to_i + 45 }
        token = JWT.encode payload, hmac_secret, 'HS256'
        render json: { token: token, msg: "ok"}
    end
end
