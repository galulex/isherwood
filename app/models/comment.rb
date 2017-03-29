class Comment < ActiveRecord::Base
  
  include PublicActivity::Common

  include ActsAsCommentable::Comment

  belongs_to :commentable, :polymorphic => true

  default_scope -> { order('created_at ASC') }

  belongs_to :user
  
  def mentions
    @mentions ||= begin
      regex = /@([\w]+)/
      self.comment.scan(regex).flatten
    end
  end
  
  def user_mentions
    @user_mentions ||= User.where(username: mentions)
  end
end
