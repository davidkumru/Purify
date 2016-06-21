class PostsController < ApplicationController
  def index
    @posts = Post.order( created_at: :desc )
  end

  def create
     post_params = params.require( :post ).permit( :title, :content )

     @post = Post.new(title: post_params[:title], content: post_params[:content] )
     @post.user = current_user
     
     if @post.save
        redirect_to posts_path
     else
        render posts_path
     end
  end

end
