class Comment < ApplicationRecord
  validates :comment, presence: true
  validates :topic_id, presence: true
  belongs_to :topic
end
