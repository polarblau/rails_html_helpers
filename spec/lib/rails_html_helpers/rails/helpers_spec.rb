require 'spec_helper'

class DummyContext < ActionView::Base; end

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
    it 'should produce a set of conditional tags' do
      helpers.html_tag.should == <<-EOS
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>    <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
      EOS
    end

    it 'should assign attributes' do
      helpers.html_tag(:foo => 'bar').should == <<-EOS
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" foo="bar"> <![endif]-->
<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" foo="bar"> <![endif]-->
<!--[if IE 8]>    <html class="no-js lt-ie9" foo="bar"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" foo="bar"> <!--<![endif]-->
      EOS
    end

    it 'should merge classes' do
      helpers.html_tag(:class => 'foo').should == <<-EOS
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7 foo"> <![endif]-->
<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8 foo"> <![endif]-->
<!--[if IE 8]>    <html class="no-js lt-ie9 foo"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js foo"> <!--<![endif]-->
      EOS
    end

  end
end
