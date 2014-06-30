module SimpleComment
  class Comment
    include Mongoid::Document
    include Mongoid::Timestamps

    field :content, :type => String

    belongs_to :commentable, :polymorphic => true
    belongs_to :reply_comment, :class_name => self.to_s, :foreign_key => :reply_comment_id

    validates  :commentable, :presence => true
    validates  :content,     :presence => true

    default_scope proc {
      order_by(:created_at => :desc)
    }

    scope :without_creator, proc {|creator|
      where(:creator_id.ne => creator.id)
    }

    scope :with_creator, proc {|creator|
      where(:creator_id.eq => creator.id)
    }

    def add_reply(creator, content)
      commentable.add_comment(creator, content, reply_comment: self)
    end
  end
end
