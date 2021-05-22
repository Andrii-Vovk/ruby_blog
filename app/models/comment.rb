class Comment < ApplicationRecord
  include Visible
  belongs_to :article
  belongs_to :author, class_name: 'User'
end
