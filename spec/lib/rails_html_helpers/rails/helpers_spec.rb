require 'spec_helper'

class DummyContext; end

describe "RailsHTMLHelpers::Rails::Helpers" do

  let(:helpers) { DummyContext.new.extend(RailsHTMLHelpers::Rails::Helpers) }

  describe '#title' do
    it 'should return a passed title partial' do
      helpers.title('foo').should == 'foo'
    end

    it 'should join multiple definitions' do
      helpers.title('foo')
      helpers.title('bar').should == 'foo | bar'
    end

    it 'should return the title when no arguments passed' do
      helpers.title('foo')
      helpers.title.should == 'foo'
    end

    it 'should support a custom separator' do
      helpers.title('foo')
      helpers.title('bar', '+').should == 'foo+bar'
    end

    it 'should allow the passing of multiple partials as array' do
      helpers.title(['foo', 'bar']).should == 'foo | bar'
    end
  end

  describe '#body_class' do

    before do
      controller = double
      helpers.stub(:controller) { controller }
      controller.should_receive(:controller_name).and_return('foo')
    end

    it 'should return the controller name' do
      helpers.body_class.should == 'foo'
    end

    it 'should include a passed class' do
      helpers.body_class('bar').should == 'foo bar'
    end

    it 'should join multiple definitions' do
      helpers.body_class('bar')
      helpers.body_class('bat').should == 'foo bar bat'
    end

    it 'should return the class when no arguments passed' do
      helpers.body_class('bar')
      helpers.body_class.should == 'foo bar'
    end

    it 'should allow the passing of multiple classes as array' do
      helpers.body_class(['bar', 'bat']).should == 'foo bar bat'
    end
  end

  describe '#html_tag' do

  end
end
