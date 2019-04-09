module Api
  module V1
    class ArticlesController < ApplicationController

      def index

          @reddit_data = Article.order('created_at DESC')

          render json: {
            status: 200,
            message: "success",
            data: @reddit_data
          }

      end
    end
  end
end
