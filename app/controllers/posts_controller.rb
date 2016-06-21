class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def create
     post_params = params.require( :post ).permit( :title, :content )

     @post = Post.new(title: post_params[:title], content: post_params[:content] )

     if @post.save
        redirect_to posts_path
     else
        render posts_path
     end
  end

end
