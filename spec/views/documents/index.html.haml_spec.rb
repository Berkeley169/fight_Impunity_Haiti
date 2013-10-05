require 'spec_helper'

describe "documents/index" do
  before(:each) do
    assign(:documents, [
      stub_model(Document,
        :name => "Name",
        :english => false,
        :french => false,
        :creole => false,
        :spanish => false
      ),
      stub_model(Document,
        :name => "Name",
        :english => false,
        :french => false,
        :creole => false,
        :spanish => false
      )
    ])
  end

  it "renders a list of documents" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 8
    assert_select "tr>td", :text => false.to_s, :count => 8
    assert_select "tr>td", :text => false.to_s, :count => 8
    assert_select "tr>td", :text => false.to_s, :count => 8
  end
end
