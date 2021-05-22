class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :validatable
         
  has_many :articles, foreign_key: :author_id, dependent: :destroy 
  has_many :comments, inverse_of: :author
end
