class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    # отображения списка всех наших статей
  end

  def show
    @article = Article.find(params[:id])
    # Article.find для поиска статьи, передав params[:id], чтобы получить параметр :id из запроса.
    # Rails передаст все переменные экземпляра во вьюху.
  end

  def new
  end

  def create
    # render plain: params[:article].inspect
    # метод render принимает очень простой хэш с ключом :plain и значением
    # params[:article].inspect. Метод params это объект, представляющий
    # параметры (или поля), приходящие от формы.

    #@article = Article.new(params[:article])
    # Rails может быть инициализирована с помощью соответствующих атрибутов,
    # которые будут автоматически привязаны к соответствующим столбцам базы данных.
    # params[:article] содержит интересующие нас атрибуты
    @article = Article.new(article_params)

    @article.save
    # ответственен за сохранение модели в базу
    # @article.save возвращает булево значение, показывающее, была ли сохранена модель, или нет.
    redirect_to @article
  end


    private
      def article_params
        params.require(:article).permit(:title, :text)
        # Защита в Rails, называется strong parameters и требует, чтобы мы
        # указали Rails, какие именно параметры разрешено передавать в экшны нашего контроллера.
      end
end
