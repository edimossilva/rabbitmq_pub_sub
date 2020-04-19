require 'rabbitmq_pub_sub'

describe RabbitmqPubSub::MockSubscriber do
  it 'MockSubscriber' do
    expect(RabbitmqPubSub::MockSubscriber.instance.start).to_not be_nil
  end
  it 'MockPublisher' do
    expect(RabbitmqPubSub::MockPublisher.instance.call({}.to_s)).to_not be_nil
  end
end
