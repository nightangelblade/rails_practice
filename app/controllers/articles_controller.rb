class ArticlesController < ApplicationController

  def show
    @article = Article.find(params[:id])
  end

  def new
    @category = Category.find(params[:category_id])
    @article = @category.articles.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @category = Category.find(params[:category_id])
    @article = @category.articles.new(article_params)

    if @article.save
      redirect_to category_path(@category)
    else
      render 'new'
    end
  end


  private
  def article_params
    params.require(:article).permit(:title, :body)
  end
end
