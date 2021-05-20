class Article < ApplicationRecord
    include Visible
    has_many :comments, dependent: :destroy
    belongs_to :author, class_name: 'User'

    validates :title, presence: true
    validates :body, presence: true, length: { minimum: 10 }
end
