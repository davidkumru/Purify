class CommentsController < ApplicationController

  def create
    comment_params = params.require( :comment ).permit( :comment )
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to @post
    else
      flash.now[:danger] = "error"
    end
  end
end
