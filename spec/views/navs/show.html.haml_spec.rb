require 'spec_helper'

describe "navs/show" do
  before(:each) do
    @nav = assign(:nav, stub_model(Nav,
      :name => "Name",
      :path => "Path",
      :image_url => "Image Url",
      :hidden-xs => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Path/)
    rendered.should match(/Image Url/)
    rendered.should match(/false/)
  end
end
