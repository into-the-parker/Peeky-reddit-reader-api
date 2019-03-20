module Api
  module V1
    class ArticlesController < ApplicationController
      def index

          @reddit_data = Article.all

          render json: {
            data: @reddit_data
          }

      end
    end
  end
end
