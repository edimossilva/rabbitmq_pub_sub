require 'rabbitmq_pub_sub/connection'

module RabbitmqPubSub
  class MockSubscriber < BaseSubscriber
    include Singleton

    def initialize
      super
      @sub_queue_name = 'rpc_mock_subscriber_request'
    end

    private

    def action(request_payload)
      GetTaskListsService.new.call(request_payload)
    end
  end
end
