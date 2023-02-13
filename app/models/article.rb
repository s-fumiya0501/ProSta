class Article < ApplicationRecord
  acts_as_taggable
  belongs_to :student

  def self.ransackable_attributes(auth_object = nil)
    ["content", "created_at", "id", "student_id", "title", "updated_at"]
  end
end
