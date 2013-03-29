require 'spec_helper'

describe SimpleComment do
  let(:commentable) {FactoryGirl.create :dummy_commentable}
  let(:creator)     {commentable.user}
  let(:commenter)   {FactoryGirl.create :user}
  let(:content)     {'dummy content'}

  describe SimpleComment::Commenter do
    context 'class methods' do
      describe '.simple_comment_user' do
        subject {commenter}
        it {should respond_to :comments}
      end
    end
  end

  describe SimpleComment::Commentable do
    context 'class methods' do
      describe '.simple_comment' do
        subject {commentable}
        it {should respond_to :comments}
      end
    end

    context 'instance methods' do
      describe '#add_comment' do
        subject {commentable.add_comment(commenter, content)}

        it                {should be_a SimpleComment::Comment}
        its(:content)     {should eq content}
        its(:commentable) {should be_a DummyCommentable}
        its(:creator)     {should eq commenter}
        it 'creates a new comment' do
          expect {subject}.to change {commentable.comments.count}.by(1)
        end
      end
    end
  end
end
