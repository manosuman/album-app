class Album < ApplicationRecord
    validates :title, presence: true
    validates :description, presence: true, length: { minimum: 7 }

    has_many :images, dependent: :delete_all
    has_many :tags
end
