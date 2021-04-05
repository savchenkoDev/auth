module AuthService
  class Client
    # See https://dry-rb.org/gems/dry-initializer/3.0/skip-undefined/
    extend Dry::Initializer[undefined: false]
  
    option :queue, default: -> { create_queue }

    private

    def create_queue
      channel = RabbitMQ.channel
      channel.queue('auth', durable:true)
    end

    def publish(payload, opts = {})
      @queue.publish(
        payload,
        opts.merge(persistent: true, app_id: 'auth' )
      )
    end
  end
end