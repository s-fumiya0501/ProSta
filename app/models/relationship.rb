class Relationship < ApplicationRecord
    belongs_to :follower, class_name: "Student"
    belongs_to :follow, class_name: "Student"
end
