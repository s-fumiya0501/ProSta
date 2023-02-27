class Public::StudentsController < ApplicationController
  def mypage
    @student = Student.find(params[:id])
    @article = Article.new
    @study = Learning.new
    @initial_value = "00:00:00"
    gon.student = @student
    gon.study_time = @initial_value
  end

  def get_tag_search
    @tags = Article.tag_counts_on(:tags).where('name LIKE(?)', "%#{params[:key]}%")
  end
end
