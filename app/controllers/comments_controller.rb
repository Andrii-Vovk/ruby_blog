class CommentsController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]

    def create
      authorize Comment
      @article = Article.find(params[:article_id])
      @comment = @article.comments.create(comment_params)

      @comment.author = current_user
      @comment.save

      redirect_to article_path(@article)
    end
    
    def destroy
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])

        authorize @comment

        @comment.destroy
        redirect_to article_path(@article)
      end

    private
      def comment_params
        params.require(:comment).permit(:commenter, :body, :status)
      end
  end
  