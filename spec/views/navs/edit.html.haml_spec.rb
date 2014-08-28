require 'spec_helper'

describe "navs/edit" do
  before(:each) do
    @nav = assign(:nav, stub_model(Nav,
      :name => "MyString",
      :path => "MyString",
      :image_url => "MyString",
      :hidden-xs => false
    ))
  end

  it "renders the edit nav form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", nav_path(@nav), "post" do
      assert_select "input#nav_name[name=?]", "nav[name]"
      assert_select "input#nav_path[name=?]", "nav[path]"
      assert_select "input#nav_image_url[name=?]", "nav[image_url]"
      assert_select "input#nav_hidden-xs[name=?]", "nav[hidden-xs]"
    end
  end
end
