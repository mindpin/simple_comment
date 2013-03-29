module SimpleComment
  module Commenter
    def self.included(base)
      base.send :extend, ClassMethods
    end

    module ClassMethods
      def simple_comment_user
        has_many :comments, class_name: self.to_s, foreign_key: :creator_id

        Comment.belongs_to(:creator,
                           class_name:  self.to_s,
                           foreign_key: :creator_id)

        Comment.belongs_to(:reply_comment_creator,
                           class_name:  self.to_s,
                           foreign_key: :reply_comment_creator_id)
      end
    end
  end
end
