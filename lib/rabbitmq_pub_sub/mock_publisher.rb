require 'singleton'
require_relative 'rpc_publisher.rb'

module RabbitmqPubSub
  class MockPublisher < RpcPublisher
    include Singleton

    def initialize
      @pub_queue_name = 'rpc_mock_publisher_request'
      @sub_queue_name = 'rpc_mock_publisher_response'
      super
    end
  end
end
