class IdeasController < ApplicationController
    before_action :authenticate_user!, only: [:new]
    def new
        @ouchi=Ouchi.find(params[:ouchi_id])
        @idea=@ouchi.ideas.build
    end
    def create
        @ouchi=Ouchi.find(params[:ouchi_id])
        @idea=@ouchi.ideas.build(idea_params)
        @idea.user_id=current_user.id
        if @idea.save
            redirect_to ouchi_path(@ouchi.id)
        else
            redirect_to new_ouchi_idea(@ouchi.id)
        end
    end

    def index
        @ouchi=Ouchi.find(params[:ouchi_id]) 
        @all_ranks = Idea.find(Like.group(:idea_id).order('count(idea_id) desc').limit(150).pluck(:idea_id))
        @ouchiid=params[:id] 
        @new=@ouchi.category+'の新規投稿画面へ'
        @ouchi=Ouchi.find(params[:ouchi_id])

    end

    private
    def idea_params
        params.require(:idea).permit(:idea)
    end
end
