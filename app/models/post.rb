class Post < ActiveRecord::Base
  belongs_to :user
  attr_accessor :poster_image_file_name
  attr_accessor :poster_image_content_type
  attr_accessor :poster_image_file_size
  attr_accessor :poster_image_updated_at

  has_attached_file :poster_image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :poster_image, :content_type => /\Aimage\/.*\Z/
  validates_attachment_file_name :poster_image, :matches => [/png\Z/, /jpe?g\Z/]

  default_scope             -> { order(created_at: :desc) }

  def feed
    Post.where("user_id = ?", id)
  end
end
