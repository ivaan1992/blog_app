class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  validates :title, presence: true
  validates :title, length: { maximum: 250 }
  validates :comments_counter, comparison: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, comparison: { only_integer: true, greater_than_or_equal_to: 0 }
  
  

  after_save :counting_post

  def five_last_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def counting_post
    author.update(posts_counter: author.posts.count)
  end
end
