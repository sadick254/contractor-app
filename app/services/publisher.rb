class Publisher
  def self.publish(queue_name, message)
    channel = connection.create_channel
    queue = channel.queue(queue_name, durable: true)
    queue.publish(message.to_json, persistent: true)
  end

  def self.connection
    @connection ||= Bunny.new.tap do |c|
      c.start
    end
  end
end