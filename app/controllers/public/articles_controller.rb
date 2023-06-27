class Public::ArticlesController < ApplicationController
  before_action :authenticate_student!
  def create
    @article=Article.new(article_params)
    @article.student_id = current_student.id
    @article.save
    redirect_to articles_path
  end

  def new
    @article = Article.new
  end

  def index
    @q = Article.ransack(params[:q])
    @articles = @q.result.page(params[:page]).per(10)
  end
  private

  def article_params
    params.require(:article).permit(:title, :content, :tag_list)
  end
end
