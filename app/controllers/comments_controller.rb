class CommentsController < ApplicationController
    def create
        @campaign = Campaign.find(params[:campaign_id])
        @comment = @campaign.comments.create(comment_params)
        redirect_to @campaign
    end

    private
        def comment_params
            params.require(:comment).permit(:autor,:message)
        end
end
