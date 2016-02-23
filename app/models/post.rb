class Post < ActiveRecord::Base
  belongs_to :user
  mount_uploader :image, ImageUploader

  def self.search(search)
    if search
      where(["content LIKE ?", "%#{search}%"])
    else
      all
    end
  end

end
