module Api
 module V1

   class ReadsController < ApplicationController

     def index
       @reads = ReadLater.all
       @read_array = []

       for i in 0..@reads.length-1 do
          article = Article.find_by(url: @reads[i].reddit_link)
          @read_array.push(article)
        end

       render json: {
         status: 200,
         message: "success",
         data: @read_array
         }
     end


     def create_read_later
       @read_later = ReadLater.find_by(reddit_link: params[:data][:article])

       if !@read_later
         ReadLater.create(reddit_link: params[:data][:article])
         render json: {
           status: 200,
           data: "success"
           }
       else
         render json: {
           status: 200,
           data: "saved already"
           }
       end
       
     end

     def destroy
       @delete_read_later = ReadLater.find_by(reddit_link: params[:data][:article])
       @delete_read_later.destroy

       render json: {
         status: 200,
         data: "success"
         }
     end

    end
   end
 end
