require "spec_helper"

describe StyleGuide::Partial do
  let(:path) { "/hygenic/_gargling.erb" }
  let(:partial) { StyleGuide::Partial.new(path) }

  describe "#title" do
    subject { partial.title }

    context "with a simple path" do
      it { should == "Gargling" }
    end

    context "with a path activerecord would be good at" do
      let(:path) { "/tasty/_tree-leather.erb" }

      it { should == "Tree Leather" }
    end

    context "with a path containing extra stuff" do
      let(:path) { "/help/_a!dog%has-m1y=keyb^oaard.erb" }

      it { should == "A!Dog%Has M1y=Keyb^Oaard" }
    end
  end

  describe "#id" do
    subject { partial.id }

    context "with a simple path" do
      it { should == "gargling" }
    end

    context "with a good activerecord path" do
      let(:path) { "/tasty/_thumb_tacks.erb" }

      it { should == "thumb_tacks" }
    end

    context "with a path containing extra stuff" do
      let(:path) { "/help/mugabe%has-m1y=keyb^oaard" }

      it { should == "mugabe_has_m1y_keyb_oaard" }
    end
  end

  describe "#content" do
    before { File.stub(:read => "reading is for chumps") }

    subject { partial.content }

    it { should == "reading is for chumps" }
  end
end
