class Public::RelationshipsController < ApplicationController
  # フォローするとき
  def create
    @student = Student.find(params[:student_id])
    current_student.follow(params[:student_id])
  end
  # フォロー外すとき
  def destroy
    @student = Student.find(params[:student_id])
    current_student.unfollow(params[:student_id])
  end
  # フォロー一覧
  def followings
    student = Student.find(params[:student_id])
    @students = student.followings
  end
  # フォロワー一覧
  def followers
    student = Student.find(params[:student_id])
    @students = student.followers
  end
end
