class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.topic_id = params[:topic_id]

    if @comment.save
      redirect_to topics_path, success: 'コメントを追加しました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      redirect_to :action => "new"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment, :topic_id)
  end
end
