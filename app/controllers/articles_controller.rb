class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = article.order(create_at: :desc)
  end

  def show
  end

  def new
    @article = Artcle.new
  end

  def edit
  end

  def create
    @article = Artcle.new(article_params)
    if @article.save
      redirect_to @article, notice: '作成されました。'
    else
      render :new, aleat: '作成できませんでした。'
    end
  end

  def update
    if @article.update(article_params)
      redirect_to @article, notice: '更新されました。'
    else
      render :edit, aleat: '更新できませんでした。'
    end
  end

  def destroy
    if @article.destroy
      redirect_to root_path, notice: '削除に成功しました。'               
    else
      redirect_to root_path, notice: '削除できませんでした。'               
    end
  end
  
  private
  def find_article
     @article = article.find(params[:id])   
  end
  
end
