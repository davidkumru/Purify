class FavoritesController < ApplicationController
  def create
   post = Post.find( params[:post_id] )
   favorite = Favorite.new( post: post, user: current_user )

   favorite.save

   redirect_to posts_path
  end
end
