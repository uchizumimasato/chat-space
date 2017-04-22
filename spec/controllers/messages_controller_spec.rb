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


  describe 'GET #index' do
    before do
      login_user user
    end

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

end
