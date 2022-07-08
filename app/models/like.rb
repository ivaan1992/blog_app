class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_save :counting_like

  private

  def counting_like
    post.update(likes_counter: post.likes.count)
  end
end
