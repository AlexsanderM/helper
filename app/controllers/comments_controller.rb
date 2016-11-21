class CommentsController < ApplicationController

  def create
    @article = Article.find(params[:article_id])
    # запрос к комментарию отслеживает статью, к которой комментарий присоединен,
    # таким образом сначала решаем вопрос с получением статьи, вызвав find на модели Article.
    @comment = @article.comments.create(comment_params)
    # метод create на @article.comments, используется чтобы создать и сохранять комментарий
    redirect_to article_path(@article)
    # Возвращает оригинальную статью, используя хелпер article_path(@article)
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
      # Защита в Rails, называется strong parameters и требует, чтобы мы
      # указали Rails, какие именно параметры разрешено передавать в экшны нашего контроллера.
    end

end
