require 'spec_helper'

describe "picture_langs/show" do
  before(:each) do
    @picture_lang = assign(:picture_lang, stub_model(PictureLang))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
