class Contact < ApplicationRecord
  belongs_to :group
  paginates_per 10
  validates :name, :email, :group_id, presence: true
  validates :name, length: {minimum: 2}

  #Used for image upload via paperclip gem
  has_attached_file :avatar, styles: { medium: "150x150>", thumb: "100x100>" }, default_url: "/images/:style/default.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/


  def gravatar
    hash = Digest::MD5.hexdigest(email.downcase)
    "https://www.gravatar.com/avatar/#{hash}"
  end
end
