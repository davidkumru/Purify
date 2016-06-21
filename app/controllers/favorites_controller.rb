class FavoritesController < ApplicationController
  def create
     post = Post.find( params[:post_id] )

     if favorite = Favorite.find_by( post: post, user: current_user )
        favorite.destroy
     else
        favorite = Favorite.new( post: post, user: current_user )
        favorite.save
     end

     redirect_to posts_path
  end
end
