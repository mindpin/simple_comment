module SimpleComment
  module Commentable
    def self.included(base)
      base.send :include, InstanceMethods
      base.send :extend,  ClassMethods
    end

    module ClassMethods
      def simple_comment(after_comment_save: proc {})
        has_many :comments, class_name: 'SimpleComment::Comment', as: :commentable
        Comment.after_save after_comment_save if after_comment_save.is_a? Proc
      end
    end

    module InstanceMethods
      def add_comment(commenter, content, reply_comment: nil)
        self.comments.create :creator       => commenter,
                             :content       => content,
                             :reply_comment => reply_comment
      end
    end
  end
end
