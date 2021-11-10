class Image < ApplicationRecord
  validates :image, presence: true
  validates :name, presence: true
  validates :all_tags, presence: true
  belongs_to :album
  has_one_attached :image
  has_many :taggings, dependent: :destroy
  has_many :tags , through: :taggings

  def pics
    return self.image.variant(resize: '295x280')
  end

  def all_tags=(names)
    self.tags = names.split(',').map do |name|
      Tag.where(name: name).first_or_create!
    end
  end
  def all_tags
    tags.map(&:name).join(", ")
  end
end
