class PostsController < ApplicationController
  def index
    @posts = Post.order( created_at: :desc )
    @dates = []
    @tags = ActsAsTaggableOn::Tag.all
    @users = User.all
  end

  def new
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

  # def search
  #   @search_results = []
  #   @tags = ActsAsTaggableOn::Tag.all
  #   @search = params[:q].downcase
  #   @tags.each do |tag|
  #     if @search.downcase == tag.downcase
  #       @search_results << tag
  #     end
  #   end
  #   if @search_results != []
  #     render 'results'
  #   else
  #     render 'not_found'
  #   end
  # end

  def user
    @user = User.find( params[:user_id] )

    @posts = Post.where( user: @user ).order( created_at: :desc )

    @favorites = @user.favorites.joins( :post ).order( "posts.created_at DESC" )
    @tags = ActsAsTaggableOn::Tag.all
    @users = User.all
  end
end
