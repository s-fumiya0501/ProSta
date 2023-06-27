class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :articles
  has_many :learnings
  geocoded_by :address
  after_validation :geocode
  has_one_attached :avater

  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "follow_id", dependent: :destroy
  
  # 一覧画面で使う
  has_many :followings, through: :relationships, source: :follow
  has_many :followers, through: :reverse_of_relationships, source: :follower
  def get_avater_image(width, height)
    unless avater.attached?
      file_path = Rails.root.join('app/assets/images/IMG_4602.jpg')
      avater.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    avater.variant(resize_to_fill: [width,height]).processed
  end

  def follow(student_id)
    relationships.create(follow_id: student_id)
  end
  # フォローを外すときの処理
  def unfollow(student_id)
    relationships.find_by(follow_id: student_id).destroy
  end
  # フォローしているか判定
  def following?(student)
    followings.include?(student)
  end
end
