class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_save :counting_comment

  private

  def counting_comment
    post.update(comments_counter: post.comments.count)
  end

end