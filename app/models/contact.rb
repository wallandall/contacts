class Contact < ApplicationRecord
  belongs_to :group
  belongs_to :user
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

  scope :search, -> (term) do
      where('LOWER(name) ILIKE :term or LOWER(company) ILIKE :term or LOWER(email) ILIKE :term', term: "%#{term.downcase}%") if term.present?
  end

  scope :by_group, -> (group_id) { where(group_id: group_id) if group_id.present? }
end
