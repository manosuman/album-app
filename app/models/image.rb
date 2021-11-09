class Image < ApplicationRecord
  belongs_to :album
  has_one_attached :image
  has_many :tags

  def pics
    return self.image.variant(resize: '295x280')
  end
end
