require "spec_helper"

describe Mongoid::Timestamps do

  describe ".included" do

    before do
      @person = Person.new
    end

    it "adds created_at and modified_at to the document" do
      fields = Person.instance_variable_get(:@fields)
      fields[:created_at].should_not be_nil
      fields[:modified_at].should_not be_nil
    end

    it "forces the timestamps to UTC" do
      @person.run_callbacks(:before_save)
      @person.created_at.should be_close(Time.now.utc, 10.seconds)
      @person.modified_at.should be_close(Time.now.utc, 10.seconds)
    end

  end

end
