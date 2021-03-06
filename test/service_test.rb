require 'test_helper'

class ServiceTest < MiniTest::Should::TestCase
  context "A Service" do
    should "be creatable with host and port" do
      svc = BananaPhone::Service.new('localhost', 9941)
      assert svc.is_a?(BananaPhone::Service)
    end

    should "be creatable with host, port, and timeout" do
      svc = BananaPhone::Service.new('localhost', 9941, 5)
      assert svc.is_a?(BananaPhone::Service)
    end
  end

  context "A Service Instance's" do
    setup do
      @svc = BananaPhone::Service.new('localhost', 9941)
    end

    context "accessors" do
      should "return it's host" do
        assert_equal 'localhost', @svc.host
      end

      should "return it's port" do
        assert_equal 9941, @svc.port
      end
    end

    context "call method" do
      should "return a call type Request" do
        req = @svc.call
        assert req.is_a?(BananaPhone::Request)
        assert_equal :call, req.kind
      end
    end

    context "cast method" do
      should "return a cast type Request" do
        req = @svc.cast
        assert req.is_a?(BananaPhone::Request)
        assert_equal :cast, req.kind
      end
    end
  end
end