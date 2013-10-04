require 'spec_helper'

describe "picture_langs/edit" do
  before(:each) do
    @picture_lang = assign(:picture_lang, stub_model(PictureLang))
  end

  it "renders the edit picture_lang form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", picture_lang_path(@picture_lang), "post" do
    end
  end
end
