class Article < ApplicationRecord
  belongs_to :user
  
  #set email to downcase at the database layer
  before_save {self.email = email.downcase}
  validates :title, presence: true, length: {minimum: 3, maximum: 50}
  validates :description, presence: true, length: {minimum: 10, maximum: 300}
  validates :user_id, presence: true
end