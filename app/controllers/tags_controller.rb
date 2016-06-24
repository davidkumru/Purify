class TagsController < ApplicationController
  def index
    @tags = ActsAsTaggableOn::Tag.all
    @users = User.all
  end

  def show
    @tag =  ActsAsTaggableOn::Tag.find(params[:id])
    @tags = ActsAsTaggableOn::Tag.all
    @posts = Post.tagged_with(@tag.name).order( created_at: :desc )
    @users = User.all
  end
end
