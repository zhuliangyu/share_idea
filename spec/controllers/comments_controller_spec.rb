require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

  describe "commenst#create" do

    context "when user log out" do
      before do
        session[:user_id]=nil

      end

      it "shoud not create a comment" do
        # set session to nil (user not sign in)

        idea=FactoryGirl.create(:idea)
        before_count=Comment.count

        post(:create, params: {comment: FactoryGirl.attributes_for(:comment), idea_id: idea.id})

        after_count=Comment.count

        expect(after_count).to(eq(before_count))

      end


    end

    context "when user log in" do
      before do
        session[:user_id]=FactoryGirl.create(:user)
        @idea=FactoryGirl.create(:idea)

      end
      it "shoud create a comment" do

        before_count=Comment.count
        post(:create, params: {comment: FactoryGirl.attributes_for(:comment), idea_id: @idea.id})

        after_count=Comment.count

        expect(after_count).to(eq(before_count+1))

      end

      it "redirects back to the idea show page" do

        post(:create, params: {comment: FactoryGirl.attributes_for(:comment), idea_id: @idea.id})

        expect(response).to(redirect_to idea_path(@idea))

      end

      it "comment associate with the logged in user" do
        post(:create, params: {comment: FactoryGirl.attributes_for(:comment), idea_id: @idea.id})

        expect(Comment.last.user_id).to(eq(session[:user_id].id))


      end

    end

  end

  describe "commenst#delete" do
    def valid_delete
      delete(:destroy, params: {id: Comment.last.id})

    end

    before do
      # create a valid comment
      @user=FactoryGirl.create(:user)
      session[:user_id]=@user
      @idea=FactoryGirl.create(:idea)
      post(:create, params: {comment: FactoryGirl.attributes_for(:comment), idea_id: @idea.id})

    end

    context "when user log out" do
      before do
        # user log out
        session[:user_id]=nil

      end
      it "shoud not delete a comment" do
        before_count=Comment.count

        # delete(:destroy, params: { id: Comment.last.id})
        valid_delete

        after_count=Comment.count

        expect(after_count).to(eq(before_count))

      end


    end

    context "when user log in" do

      it "shoud delete a comment" do

        session[:user_id]=@user
        before_count=Comment.count
        # 1

        # delete(:destroy, params: { id: Comment.last.id})
        valid_delete

        after_count=Comment.count
        # 0


        expect(after_count+1).to(eq(before_count))

      end


    end

    it "redirects back to the idea show page" do
      valid_delete

      expect(response).to(redirect_to idea_path(@idea))


    end


    it "Users can not delete others people comments" do
      session[:user_id]=FactoryGirl.create(:user)
      before_count=Comment.count #1

      valid_delete

      after_count=Comment.count #1


      expect(after_count).to(eq(before_count))

    end

  end

end


