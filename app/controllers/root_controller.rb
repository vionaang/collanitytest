class RootController < ApplicationController
    def index
        @posts = Post.all
        render "index"
    end

    def about
        render "about"
    end

    def contact
        render "contact"
        # redirect_to("\about")
    end

    def api
        @response = {
            :status => 200,
            :message => "Hello world"
        }
        render json: @response
    end

    def user
        # render json: params[:id]
        render json: params
    end

    def add
        @post = Post.new
        @post.title = params[:title]
        @post.description = params[:description]
        @post.save

       
        @response = {
            :status => 200,
            :message => "Saved succesfully"
        }
        @posts = Post.all
        render "index"
        # render json: params

    end
    
    def delete
        render json: params
    end
    
end