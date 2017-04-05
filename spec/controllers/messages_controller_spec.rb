require 'rails_helper'

describe MessagesController do

  describe 'GET #index' do

    it "populates an array of messages current_user of groups" do
      groups = create_list(:group, 3)
      get :index
      expect(assigns(:groups)).to match(group)
    end

    it "renders the :index template" do
    end
  end

end
