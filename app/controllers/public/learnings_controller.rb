class Public::LearningsController < ApplicationController
  def create
    @study = Learning.new(learning_params)
    @s= params[:learning][:study_time]
    @study.title = "Test"
    @study.study_time = @s.to_i
    @study.save
    redirect_to learnings_path
  end

  def new
    @study = Learning.new
  end

  def index
    @learnings = Learning.all
  end

  private

  def learning_params
    params.require(:learning).permit(:study_time)
  end
end
