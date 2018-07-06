class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @topic = current_user.comments.new(comment_params)

    if @comment.save
      redirect_to topics_path, success: 'コメントを追加しました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      redirect_to topics_path
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end     
end
