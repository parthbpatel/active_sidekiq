class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def show
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      SendNotificationsJob.perform_now(@article)

      redirect_to article_path(@article.id)
    else
      render 'new'
    end
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end
end
