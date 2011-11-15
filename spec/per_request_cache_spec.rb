require 'spec_helper'

describe PerRequestCache do
  before do
    PerRequestCache.clear_cache
    @executor = mock("Executor", :stub! => "something")
  end

  it "doesn't not store the result if the cache wasn't initialized" do
    @executor.should_receive(:something).twice.and_return 23

    PerRequestCache.cached(:abc) { @executor.something }.should == 23
    PerRequestCache.cached(:abc) { @executor.something }.should == 23
  end

  context "when cache enabled" do
    before do
      PerRequestCache.initialize_cache
    end

    it "uses the stored result if it exists" do
      @executor.should_receive(:something).once.and_return 23

      PerRequestCache.cached(:abc) { @executor.something }.should == 23
      PerRequestCache.cached(:abc) { @executor.something }.should == 23
    end

    it "uses the stored result if it's nil" do
      @executor.should_receive(:something).once.and_return nil

      PerRequestCache.cached(:abc) { @executor.something }.should be_nil
      PerRequestCache.cached(:abc) { @executor.something }.should be_nil
    end
  end
end
