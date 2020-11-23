class CommentsController < ApplicationController



  def  create
    @comment = Comment.new(comment_params)
   if @comment.save
     redirect_to message_path(@comment.message)
     ActionCable.server.broadcast 'comment_channel', content: @comment
    else
         @message = @comment.message
         @comments = @message.comments
        render "messages/show" 
  end
end 



  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, message_id: params[:message_id])
  end
end
