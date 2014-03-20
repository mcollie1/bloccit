class CommentsController < ApplicationController

  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
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

    def destroy
      @topic = Topic.find(params[:topic_id])
      @post = @topic.posts.find(params[:post_id])

      @comment = @post.comments.find(params[:id])

      authorize @comment
      if @comment.destroy
        flash[:notice] = "Comment was removed."
        redirect_to [@topic, @post]
      else
        flash[:error] = "Comment couldn't be deleted. Try again."
        redirect_to [@topic, @post]
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end
end
