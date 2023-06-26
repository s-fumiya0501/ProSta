class Public::LearningsController < ApplicationController
  def create
    @study = Learning.new(learning_params)
    @s= params[:learning][:study_time]
    @study.study_time = @s.to_i
    @study.language_id = params[:learning][:language_id]
    @study.student_id = current_student.id
    @study.title = params[:learning][:title]
    @study.save
    redirect_to student_path(current_student.id)
  end

  def new
    @study = Learning.new
  end

  def index

      @total_ranking = Student.joins(:learnings)
                              .group(:id)
                              .order('SUM(learnings.study_time) DESC')
                              .limit(3)
  
      @weekly_ranking = Student.joins(:learnings)
                               .where('learnings.created_at >= ?', 1.week.ago)
                               .group(:id)
                               .order('SUM(learnings.study_time) DESC')
                               .limit(3)
  
      @monthly_ranking = Student.joins(:learnings)
                                .where('learnings.created_at >= ?', 1.month.ago)
                                .group(:id)
                                .order('SUM(learnings.study_time) DESC')
                                .limit(3)
      @all= Learning.all.order(created_at: :desc).page(params[:page]).per(10)
  end

  def confirm
    @study = Learning.new(learning_params)
    @study.study_time=(params[:learning][:study_time]).to_i
  end
  private

  def learning_params
    params.require(:learning).permit(:study_time,:title,:language_id,:student_id)
  end
end
