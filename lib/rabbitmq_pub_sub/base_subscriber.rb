require 'rabbitmq_pub_sub/connection'

module RabbitmqPubSub
  class BaseSubscriber
    attr_accessor :connection, :channel, :exchange, :sub_queue_name

    def initialize
      @connection = Connection.instance.connection
      @channel = connection.create_channel
      @exchange = channel.default_exchange
    end

    def start
      subscribe(handle_response)
    end

    def stop
      channel.close
    end

    def validate_payload!(payload)
      if payload.empty? ||
         payload.nil? ||
         !payload.is_a?(String)
        raise StandardError, "Invalid payload value:#{payload}"
      end

      true
    end

    def validate_headers!(headers)
      if headers.nil? ||
         !headers.key?(:status_code)
        raise StandardError, "Invalid headers value:#{headers}"
      end

      true
    end

    private

    def handle_response
      lambda do |_delivery_info, properties, request_payload|
        result = action(request_payload)
        publish(
          payload: result[:payload].to_json,
          routing_key: properties.reply_to,
          correlation_id: properties.correlation_id,
          headers: result[:headers]
        )
      end
    end

    def subscribe(handle_response)
      raise StandardError, 'channel is nil' if channel.nil?

      sub_queue = channel.queue(sub_queue_name)
      sub_queue.subscribe(&handle_response)
    end

    def publish(payload:, routing_key:, correlation_id:, headers:)
      validate_payload!(payload)
      validate_headers!(headers)

      exchange.publish(
        payload,
        routing_key: routing_key,
        correlation_id: correlation_id,
        headers: headers
      )
    end
  end
end
