class Post < ApplicationRecord
    belongs_to :author, class_name: 'User'
    has_many :comments
    has_many :likes
  
    after_save :counting_post
  
    def five_last_comments
      comments.order(created_at: :desc).limit(5)
    end
  
    private
  
    def counting_post
      author.update(posts_counter: author.posts.count)
    end

end