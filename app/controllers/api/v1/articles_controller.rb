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
  end
end
