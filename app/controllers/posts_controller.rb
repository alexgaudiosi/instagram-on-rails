class PostsController < ApplicationController
	
	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new params[:post].permit(:description, :picture)

		if @post.save
			redirect_to '/posts'
		else
			render 'new'
		end
	end
end
