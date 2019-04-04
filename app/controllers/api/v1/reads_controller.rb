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

       render json:{
         data: @read_array
         }
     end

     def create_read_later
       @read_later = ReadLater.find_or_create_by(reddit_link: params[:data][:article])

       if @read_later
       render json:{
         data: "saved already"
         }
       else
         @read_later.save
         render json:{
           data: "success"
           }
       end

     end

     def destroy
       @delete_read_later = ReadLater.find_by(reddit_link: params[:data][:article])
       @delete_read_later.destroy

       render json:{
         data: "success"
         }
     end
     
   end
   end
 end
