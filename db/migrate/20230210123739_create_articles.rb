class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.integer :student_id
      t.string :title
      t.string :content
      t.timestamps
    end
  end
end
