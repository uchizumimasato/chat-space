require 'rails_helper'

describe MessagesController do

  let(:message) do
    create(:message)
  end

  let(:group) do
    create(:group)
  end

  let(:user) do
    create(:user)
  end

  before do
    login_user user
  end


  describe 'GET #index' do

    it "populates an array of @groups" do
      groups = user.groups
      get :index, id: message, group_id: group.id
      expect(assigns(:groups)).to match(groups)
    end

    it "populates an array of @group" do
      get :index, id: message, group_id: group.id
      expect(assigns(:group)).to eq group
    end

    it "populates an array of @messages" do
      messages = group.messages
      get :index, id: message, group_id: group.id
      expect(assigns(:messages)).to match(messages)
    end

    it "pupulates an array of @users" do
      users = group.users
      get :index, id: message, group_id: group.id
      expect(assigns(:users)).to match(users)
    end

    it "renders the :index template" do
      get :index, id: message, group_id: group.id
      expect(response).to render_template :index
    end
  end


  describe 'POST #create' do

    it "saves the new messages in the databases" do
      expect{
      post :create, params: { message: attributes_for(:message, { body: 'hello' }), group_id: group.id }
      }.to change(Message, :count).by(1)
    end

    it "saves the don't new messages in the databases" do
      expect{
      post :create, params: { message: attributes_for(:invalid_message), group_id: group.id }
      }.not_to change(Message, :count)
    end

    it "redirects to message#index" do
      post :create, params: { message: attributes_for(:message, { body: 'hello' }), group_id: group.id }
      expect(response).to redirect_to group_messages_path(group)
    end

    it "redirects to don't save message#index" do
      post :create, params: { message: attributes_for(:invalid_message), group_id: group.id }
      expect(response).to redirect_to group_messages_path(group)
    end

  end

end
