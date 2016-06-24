class PostsController < ApplicationController
  def index
    @posts = Post.order( created_at: :desc )
    @dates = []
    @tags = ActsAsTaggableOn::Tag.all
    @users = User.all
  end

  def new
    @tags = ActsAsTaggableOn::Tag.all
    @users = User.all
  end

  def show
    @post = Post.find( params[:id])
    @tags = ActsAsTaggableOn::Tag.all
    @users = User.all
  end

  def create
    post_params = params.require( :post ).permit( :title, :content, :tag_list )

    @post = Post.new(title: post_params[:title], content: post_params[:content], tag_list: post_params[:tag_list] )
    @post.user = current_user

    if @post.save
      redirect_to posts_path
    else
      render posts_path
    end
  end

  def search
    @search_result = false
    @tags = ActsAsTaggableOn::Tag.all
    @users = User.all
    @search = params[:q]
    @tags.each do |tag|
      if @search.downcase == tag.name.downcase
        redirect_to tag_path(tag)
        @search_result = true
      end
    end
    @users.each do |user|
      if @search.downcase == user.handle.downcase
        redirect_to user_posts_path(user)
        @search_result = true
      end
    end
    if not @search_result
      render 'notfound'
    end
  end

  def user
    @user = User.find( params[:user_id] )

    @posts = Post.where( user: @user ).order( created_at: :desc )

    @favorites = @user.favorites.joins( :post ).order( "posts.created_at DESC" )
    @tags = ActsAsTaggableOn::Tag.all
    @users = User.all
  end
end
