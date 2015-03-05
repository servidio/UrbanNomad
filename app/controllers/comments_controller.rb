class CommentsController < ApplicationController

	def new
		@comment = Comment.new
	end

	def create
		@comment = Comment.new
		safe_comment = params.require(:comment).permit(:trip_id, :body)
		@comment = current_user.comments.new safe_comment
		@comment.trip_id = params[:comment][:trip_id]
		@comment.save
		redirect_to trip_path(@comment.trip_id)
	end

	def destroy
		@comment = Comment.find(params[:id])
	@comment.destroy
	redirect_to trip_path(params[:trip_id]), notice: "Comment removed!"
	end

end
