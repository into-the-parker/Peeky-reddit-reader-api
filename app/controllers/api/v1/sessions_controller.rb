module Api
  module V1
    class SessionsController < ApplicationController

      def find
        user = User.find_by(email: params[:session][:email])
        if user && user.authenticate(params[:session][:password])
          render json: {
            message: "Success",
            data: user
          }
          else
            render json: {
             message: "Failed",
             data: "Please try again"
          }
        end
      end

    end
  end
end
