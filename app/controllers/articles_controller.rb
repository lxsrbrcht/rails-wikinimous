class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :edit, :update, :destroy]

  def find_article
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def show
    # before_action set
  end

  def new
    @article = Article.new(articles_params)
  end

  def create
    @article = Article.new(articles_params)
    @article.save
  end

  def edit
    # before_action set
  end

  def update
    @article.update(articles_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article.destroy
    redirect_to articles_path, status: :see_other
  end

  private

  def articles_params
    params.require(:article).permit(:title, :content)
  end
end
