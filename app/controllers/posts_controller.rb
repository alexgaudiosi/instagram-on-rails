class PostsController < ApplicationController
	
	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new params[:post].permit(:description, :picture, :tag_names)

		if @post.save
			redirect_to '/posts'
		else
			render 'new'
		end
	end

	def destroy
		@post = Post.find params[:id]
		@post.destroy

		redirect_to '/posts'
	end
end
