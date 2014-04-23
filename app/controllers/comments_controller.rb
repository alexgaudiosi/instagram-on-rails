class CommentsController < ApplicationController

	def new
		@post = Post.find params[:post_id]
		@comment = Comment.new
	end

	def create
		@post = Post.find params[:post_id]
		@post.comments.new params[:comment].permit(:content)

		if @post.save
			flash[:notice] = 'Thanks for your comment'
			redirect_to '/posts'
		else
			render 'new'
		end
	end
end