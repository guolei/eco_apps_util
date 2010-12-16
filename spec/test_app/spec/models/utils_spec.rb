require 'spec_helper'

describe "Utils" do

  describe "random_salt" do
    it "should generate salt" do
      EcoApps::Util.random_salt.size.should == 128
    end
  end

  describe "encrypt" do
    it "should encrypt raw data" do
      EcoApps::Util.encrypt("test")
      EcoApps::Util.encrypt("test", "salt")
    end
  end

  describe "env_value" do
    it "should get value by rails environment" do
      EcoApps::Util.env_value("test").should == "test"
      EcoApps::Util.env_value("test" => "test mode").should == "test mode"
      EcoApps::Util.env_value(:other => "test mode").should == {:other => "test mode"}
    end
  end
end