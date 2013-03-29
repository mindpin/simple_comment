配置
=========
---------

```ruby
  class Question < ActiveRecord::Base
    include SimpleComment::Commentable
    simple_comment :after_comment_save => lambda {|comment,question|
      # 如果是针对 question 创建的评论，当评论被创建后，运行这个钩子
    }
  end
```

```ruby
class User < ActiveRecord::Base
  include SimpleComment::Commenter

  # 给 User 增加评论的相关方法
  simple_comment_user
end
```
