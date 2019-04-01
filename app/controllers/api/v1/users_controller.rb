module Api
  module V1
    class UsersController < ApplicationController

      def create
        puts params
        user = User.create(email: params[:user][:email], username: params[:user][:username], password: params[:user][:password])
          if user.save
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
