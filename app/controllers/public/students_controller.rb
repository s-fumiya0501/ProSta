class Public::StudentsController < ApplicationController
  before_action :authenticate_student!
  before_action :check_student,only: [:mypage]
  def mypage
    @student = current_student
    @article = Article.new
    @study = Learning.new
    @initial_value = "00:00:00"
    gon.student = @student
    gon.study_time = @initial_value
  end

  def get_tag_search
    @tags = Article.tag_counts_on(:tags).where('name LIKE(?)', "%#{params[:key]}%")
  end


  def show
    @student=Student.find(params[:id])
    @learnings = @student.learnings.order(created_at: :desc).page(params[:page]).per(10)
    @data = @student.learnings.joins(:language).group('languages.name').sum('learnings.study_time / 60')
    @top_languages = @data.sort_by { |_, v| -v }.first(3)
    @top_languages.each_with_index do |(language, study_time), index|
      size = case index
        when 0 then "large"
        when 1 then "medium"
        when 2 then "small"
      end
      puts "<p style='font-size:#{size}'>#{index + 1}. #{language}: #{study_time} hours</p>"
    end
  end
  
  private

  def check_student
    unless current_student
      redirect_to root_path
    end
  end
end
