class CreateLearnings < ActiveRecord::Migration[6.1]
  def change
    create_table :learnings do |t|
      t.integer :language_id
      t.integer :student_id
      t.string :title
      t.integer :study_time
      t.timestamps
    end
  end
end
