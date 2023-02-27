class CreateLearnings < ActiveRecord::Migration[6.1]
  def change
    create_table :learnings do |t|
      t.string :title
      t.integer :study_time
      t.timestamps
    end
  end
end
