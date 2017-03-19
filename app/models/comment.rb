class Comment < ActiveRecord::Base

  include ActsAsCommentable::Comment

  belongs_to :commentable, :polymorphic => true

  default_scope -> { order('created_at ASC') }

  # NOTE: install the acts_as_votable plugin if you
  # want user to vote on the quality of comments.
  #acts_as_voteable

  # NOTE: Comments belong to a user
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
