module Api
  module V1
    class UsersController < ApplicationController

      def create
        puts params
        user = User.create(email: params[:user][:email], username: params[:user][:username], password: params[:user][:password])
          if user.save
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
