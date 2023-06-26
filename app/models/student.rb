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

  def get_avater_image(width, height)
    unless avater.attached?
      file_path = Rails.root.join('app/assets/images/IMG_4602.jpg')
      avater.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    avater.variant(resize_to_fill: [width,height]).processed
  end
end
