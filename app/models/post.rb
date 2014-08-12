class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  belongs_to :topic

  default_scope { order('created_at DESC') }

  scope :alphabetized, -> { order("title ASC") }

  scope :since_yesterday, -> { where( "created_at > '#{Time.now - 2.days.ago}'" )}

end
