require File.dirname(__FILE__) + '/spec_helper'

describe ActiveRecord::Base, "with from_param" do
  before(:each) do
    @paramed = ParameteredModel.new
  end
  
  it "#param_column? should be true if there is a param column, false otherwise" do
    ParameteredModel.param_column?.should be_true
    UnparameteredModel.param_column?.should be_false
  end
  
  it "should automatically save the to_param to the param field if one exists" do
    @paramed.name = "Angus McIntyre"
    @paramed.save
    ParameteredModel.find(@paramed.id).param.should == "angus-mcintyre"
  end
  
  it "should retrieve a model from its to_param" do
    @paramed.name = "Bob McFinchalot!!!"
    @paramed.save
    ParameteredModel.from_param(@paramed.to_param).should == @paramed
  end
  
  it "#from_param should work on models that don't have a param attribute using the id instead" do
    unparamed = UnparameteredModel.create(:name => "Something")
    unparamed.to_param.should == "1-something"
    UnparameteredModel.from_param(unparamed.to_param).should == unparamed
  end
  
  it "should allow the param column to be set to any column" do
    @paramed = SluggedModel.new
    @paramed.name = "Bob McFinchalot!!!"
    @paramed.save
    SluggedModel.from_param(@paramed.to_param).should == @paramed
  end
end