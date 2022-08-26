class ProductsController < ApplicationController
    def new
        @product = Product.new

        # render json: @Products
        render "new"
    end

    def list
        @products = Product.all

        render "list"
    end

    def detail
        @product = Product.find(params[:id])
        render "detail"
    end


    def add
        @product = Product.new
        @message = nil
        url = "http://world.openfoodfacts.org/api/v0/product/" + params[:upc_code] + ".json"
        begin
            response = RestClient.get(url)
            result = JSON.parse(response.body)
            if(result['status']==1)
                @product.id = result['code']
                @product.product_name = result['product']['product_name']
                @product.quantity = result['product']['quantity']
                @product.brands = result['product']['brands']
                @product.categories = result['product']['categories']
                @product.ingredients_text = result['product']['ingredients_text']
                @product.imageurl = result['product']['image_front_small_url']

                if @product.save
                    begin
                        redirect_to "/list"
                    rescue SocketError => e
                        @message = "Something Went Wrong"
                        render "new"
                    end
                    
                else
                    render "new"
                end
            else
                @message = "No code or invalid code"
                render "new"
            end
        rescue SocketError => e
            @message = "Oops, Something Went Wrong"
            render "new"
        end
        

        # render "new"

       
        # @response = {
        #     :status => 200,
        #     :message => "Saved succesfully"
        # }
        # @posts = Post.all
        # render "index"
        # render json: params
    end

    def delete
        Product.find_by(id: params[:id]).destroy
        @products = Product.all
        render "list"
    end


end
