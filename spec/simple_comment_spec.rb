require 'spec_helper'

module SimpleComment
  describe SimpleComment do
    let(:commentable) {DummyCommentable.create :creator => User.create}
    let(:creator)     {commentable.creator}
    let(:commenter)   {User.create}
    let(:content)     {'dummy content'}
  
    describe Commenter do
      context 'class methods' do
        describe '.simple_comment_user' do
          subject {commenter}
          it {should respond_to :comments}
        end
      end
    end
  
    describe Commentable do
      context 'class methods' do
        describe '.simple_comment' do
          subject {commentable}
          it {should respond_to :comments}
        end
      end
  
      context 'instance methods' do
        describe '#add_comment' do
          subject {commentable.add_comment(commenter, content)}
  
          it {should be_a Comment}
          it {expect(subject.content).to eq content}
          it {expect(subject.commentable).to be_a DummyCommentable}
          it {expect(subject.creator).to eq commenter}
          it 'creates a new comment' do
            expect {subject}.to change {commentable.comments.count}.by(1)
          end
        end
      end
    end

    context "comments are replyable" do
      let(:comment1) {commentable.add_comment creator, content}
      let(:comment2) {comment1.add_reply commenter, content}
      subject {comment2}

      it {should be_a Comment}
      it {expect(subject.content).to eq content}
      it {expect(subject.reply_comment).to be_a Comment}
      it {expect(subject.creator).to eq commenter}
      it 'creates a new comment' do
        comment1
        expect {subject}.to change {commentable.comments.count}.by(1)
      end
    end
  end
end
