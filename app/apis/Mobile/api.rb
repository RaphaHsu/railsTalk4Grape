# using utf-8
module Mobile
  class API < Grape::API
  	default_format :json
    format :json
    prefix :api
    version 'v1'

  	helpers do
  		def validation
  			#....
  		end

  		def current_user
  			# find a user...
  		end

  	end

  	resource :posts do

  		get 'hello' do
	  		{ hello: "hello" }
	  	end

  		desc "posts#index"
      get do
	  		Post.all
	  	end

  		desc "posts#show"
  		params do
        requires :id, type: Integer, desc: "params[:id]"
        # optional :end_time, type: String
      end
      route_param :id do
	  		get do
	  			Post.find(params[:id])
	  		end
	  	end

	  end

  end
end