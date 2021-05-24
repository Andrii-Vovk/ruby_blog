class Article < ApplicationRecord
    include Visible
    has_many :comments, dependent: :destroy
    belongs_to :author, class_name: 'User'
    has_one_attached :top_photo

    validates :title, presence: true
    validates :body, presence: true, length: { minimum: 10 }
    validates :top_photo, blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg', 'image/gif'], size_range: 1..10.megabytes }

    scope :article_status, ->(stat) { where(status: stat) }
    scope :ordered, ->(direction = :desc) { order(created_at: direction) }
    scope :including_authors, ->() { includes(:author) }

    scope :search, ->(query) do
        return if query.blank?
        
        query = query.strip.split.join(" ")   
        where('title LIKE ?', "#{query}%")
    end

    scope :tag_filter, ->(query) do
        return if query.blank?
        
        query = query.strip.split.join(" ")   
        where('tag LIKE ?', "#{query}%")
    end

end
