class Comment < ActiveRecord::Base
  belongs_to :listing
  belongs_to :user
  validates :body, presence: true, length: { minimum: 10 }
end