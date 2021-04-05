channel = RabbitMQ.consumer_channel
exchange = channel.default_exchange
queue = channel.queue('auth', durable: true)

queue.subscribe do |delivery_info, properties, payload|
  payload = JSON(payload)

  user_id = Auth::RPC::FetchUserService.call(payload['token']).user_id

  exchange.publish(
    user_id.to_s,
    routing_key: properties.reply_to,
    correlation_id: properties.correlation_id
  )
end