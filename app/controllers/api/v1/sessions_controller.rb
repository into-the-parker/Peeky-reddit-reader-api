module Api
  module V1
    class SessionsController < ApplicationController

      def find
        user = User.find_by(email: params[:session][:email])
        if user && user.authenticate(params[:session][:password])
        render json: {
          data: user
        }
      else
        render json: {
          data: "failed"
      }
      end
      end

    end
  end
end
