class Article < ApplicationRecord
    include Visible
    has_many :comments, dependent: :destroy
    belongs_to :author, class_name: 'User'
    has_one_attached :top_photo

    validates :title, presence: true
    validates :body, presence: true, length: { minimum: 10 }

    scope :article_status, ->(stat) { where(status: stat) }
    scope :ordered, ->(direction = :desc) { order(created_at: direction) }
    scope :including_authors, ->() { includes(:author) }

end
