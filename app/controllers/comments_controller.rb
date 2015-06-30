class CommentsController < ApplicationController
  
  before_action :authenticate_user!, only: :destroy
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment].permit(:name, :body))
 
    redirect_to post_path(@post), notice: 'Comment was successfully created.'
  end
  
  def destroy
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.destroy

		redirect_to post_path(@post), notice: 'Comment was successfully deleted.'
	end
  
end
