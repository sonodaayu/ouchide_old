class LikesController < ApplicationController
    def create
        @like = current_user.likes.create(idea_id: params[:idea_id])
        redirect_back(fallback_location: root_path)
      end
    
      def destroy
        @like = Like.find_by(idea_id: params[:idea_id], user_id: current_user.id)
        @like.destroy
        redirect_back(fallback_location: root_path)
      end
end
