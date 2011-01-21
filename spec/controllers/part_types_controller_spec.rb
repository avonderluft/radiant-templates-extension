require File.dirname(__FILE__) + '/../spec_helper'

describe Admin::PartTypesController do
  dataset :users, :part_types

  before :each do
    login_as :admin
  end

  it "should be a ResourceController" do
    controller.should be_kind_of(Admin::ResourceController)
  end

  it "should handle PartTypes" do
    controller.class.model_class.should == PartType
  end

  describe "show" do
    it "should redirect to the edit action" do
      get :show, :id => 1
      response.should redirect_to(edit_admin_part_type_path(params[:id]))
    end

    it "should show xml when format is xml" do
      part_type = PartType.first
      get :show, :id => part_type.id, :format => "xml"
      response.body.should == part_type.to_xml
    end
  end

  describe "with invalid page id" do
    [:edit, :remove].each do |action|
      before do
        @parameters = {:id => 999}
      end
      it "should redirect the #{action} action to the index action" do
        get action, @parameters
        response.should redirect_to(admin_part_types_path)
      end
      it "should say that the 'Part Type could not be found.' after the #{action} action" do
        get action, @parameters
        flash[:notice].should == 'Part Type could not be found.'
      end
    end
    it 'should redirect the update action to the index action' do
      put :update, @parameters
      response.should redirect_to(admin_part_types_path)
    end
    it "should say that the 'Part Type could not be found.' after the update action" do
      put :update, @parameters
      flash[:notice].should == 'Part Type could not be found.'
    end
    it 'should redirect the destroy action to the index action' do
      delete :destroy, @parameters
      response.should redirect_to(admin_part_types_path)
    end
    it "should say that the 'Part Type could not be found.' after the destroy action" do
      delete :destroy, @parameters
      flash[:notice].should == 'Part Type could not be found.'
    end
  end

  { :get => [:index, :new, :edit, :remove],
    :post => [:create],
    :put => [:update],
    :delete => [:destroy] }.each do |method, actions|
    actions.each do |action|
      it "should require login to access the #{action} action" do
        logout
        lambda { send(method, action).should require_login }
      end

      it "should allow access to admins for the #{action} action" do
        lambda {
          send(method, action, :id => part_type_id(:one_line))
        }.should restrict_access(:allow => [users(:admin)],
                                 :url => '/admin/pages')
      end

      it "should deny non-admins for the #{action} action" do
        lambda {
          send(method, action, :id => part_type_id(:plaintext))
        }.should restrict_access(:deny => [users(:non_admin), users(:existing)],
                                 :url => '/admin/pages')
      end
    end
  end

end
