class Album < ApplicationRecord
    validates :title, presence: true
    validates :description, presence: true

    has_many :images, dependent: :destroy
    belongs_to :user
end
