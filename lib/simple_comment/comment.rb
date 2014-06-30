module SimpleComment
  class Comment
    include Mongoid::Document
    include Mongoid::Timestamps
    include Commentable

    simple_comment

    field :content, :type => String

    belongs_to :commentable, polymorphic: true

    validates  :commentable, presence: true
    validates  :content,     presence: true

    default_scope proc {
      order_by(:created_at => :desc)
    }

    scope :without_creator, proc {|creator|
      where(:creator_id.ne => creator.id)
    }

    scope :with_creator, proc {|creator|
      where(:creator_id.eq => creator.id)
    }
  end
end
