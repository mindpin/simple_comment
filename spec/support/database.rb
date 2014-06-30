ENV["MONGOID_ENV"] = "test"
Mongoid.load!("./spec/mongoid.yml")

class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include SimpleComment::Commenter

  has_many :dummy_commentables,
           :foreign_key => :creator_id

  simple_comment_user
end

class DummyCommentable
  include Mongoid::Document
  include Mongoid::Timestamps
  include SimpleComment::Commentable

  field :content, :type => String

  belongs_to :creator,
             :class_name => 'User',
             :foreign_key => :creator_id

  simple_comment
end
