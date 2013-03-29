ActiveRecord::Base.logger = ActiveSupport::BufferedLogger.new(File.dirname(__FILE__) + "/debug.log")
ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: ':memory:')
ActiveRecord::Schema.define do
  create_table :dummy_commentables do |t|
    t.integer :user_id
  end unless table_exists?(:dummy_commentables)

  create_table :users unless table_exists?(:users)

  create_table :comments, :force => true do |t|
    t.integer  :commentable_id
    t.string   :commentable_type
    t.integer  :creator_id
    t.text     :content
    t.integer  :reply_comment_id
    t.integer  :reply_comment_creator_id
    t.datetime :created_at
    t.datetime :updated_at
  end unless table_exists?(:comments)
end

class User < ActiveRecord::Base
  include SimpleComment::Commenter

  has_many :dummy_commentables
  simple_comment_user
end

class DummyCommentable < ActiveRecord::Base;
  include SimpleComment::Commentable

  belongs_to :user
  simple_comment
end
