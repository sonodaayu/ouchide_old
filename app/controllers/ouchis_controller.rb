class OuchisController < ApplicationController
    
    def index
        @ouchi=Ouchi.all 
        @all_ranks = Idea.find(Like.group(:idea_id).order('count(idea_id) desc').limit(100).pluck(:idea_id))
        
        
    end
    def show
        
        @ouchi=Ouchi.find(params[:id])
        @ideas=@ouchi.ideas.all
        @ouchiid=params[:id] 
        @new=@ouchi.category+'の新規投稿画面へ'

        @idea= @ouchi.ideas.build
        
    end

    
end
