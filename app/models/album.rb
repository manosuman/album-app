class Album < ApplicationRecord
    validates :title, presence: true
    validates :description, presence: true, length: { minimum: 7 }

    has_many :images, dependent: :destroy
    belongs_to :user
end
