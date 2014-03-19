class CommentsController < ApplicationController

  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(param[:topic_id])
    @comments = @post.comments

    @comment = current_user.comments.build(comment_params)
    @comment.post = @post
    @new_comment = Comment.new
    

    authorize @comment
    if @comment.save
      redirect_to [@topic, @post], notice: "Comment was submitted successfully."
    else
      flash[:error] = "There was an error submitting the comment. Please try again."
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body. :post_id)
  end
end
