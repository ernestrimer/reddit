lass CommentsController < ApplicationController
  before_action :set_topic
  before_action :set_comment, only: [
    :show, :edit, :update, :destroy]
  def index
    @comments = @topic.comments
  end
  def show
  end
  def new
    @comment = @topic.comments.new 
    render partial: "form"
  end
  def create
    @comment = @topic.comments.new(comment_params)
    if @comment.save
      redirect_to [@topic, @comment]
    else
      render :new
    end
  end
  def edit
    render partial: "form"
  end
  def update
    if @comment.update(comment_params)
      redirect_to [@topic, @comment]
    else
      render :edit
    end
  end
  def destroy
    @comment.destroy
    redirect_to topic_comments_path(@topic)
  end
  private
    def comment_params
      params.require(:comment).permit(:author, :body)
    end
    def set_comment
      @comment = Comment.find(params[:id])
    end
    def set_topic
      @topic = Topic.find(params[:topic_id])
    end
end
