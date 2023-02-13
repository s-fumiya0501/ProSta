class Public::StudentsController < ApplicationController
  def mypage
    @student = Student.find(params[:id])
    @article = Article.new
    gon.student = @student
  end
end
