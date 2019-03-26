module Api
  module V1
    class ArticlesController < ApplicationController

      def index

          @reddit_data = Article.order('created_at DESC')

          render json: {
            data: @reddit_data
          }

      end
    end

    class UsersController < ApplicationController

      def index

        render json: {
          data: "it works"
        }
      end

        def create
          @user = User.create(user_params)
        end

        def show
          @user = User.all

          render json: {
            data: @user
          }
        end

        private

        def user_params
          params.require(:user).permit(:email, :username, :password_digest [])
        end
      end


  end
end
