class ArticlesController < ApplicationController
  before_action :article, only: [:edit, :show, :update, :destroy]
  def index
    @tasks = Article.all
  end

  def show
  end

  def new
    @article = Article.new(title: params[:title], content: params[:content])
  end

  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to articles_path
  end

  def edit
  end

  def update
    @article.update(article_params)
    redirect_to articles_path
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private
  def article_params
    params.require(:article).permit(:title, :content)
  end

  def article
    @article = Article.find(params[:id])
  end
end
