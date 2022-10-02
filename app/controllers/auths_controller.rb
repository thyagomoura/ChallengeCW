class AuthsController < ApplicationController
    def create
        hmac_secret = 'BE6375388567752043'
        payload = { name: params[:name], exp: Time.now.to_i + 45 }
        token = JWT.encode payload, hmac_secret, 'HS256'
        render json: { token: token, msg: "ok"}
    end
end
