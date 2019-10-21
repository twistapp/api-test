module SubscribeExtension
  def subscribe(topic, queue)
    logical_id = "#{topic}_#{queue}".camelize
    resource(logical_id, "AWS::SNS::Subscription",
      protocol: "sqs",
      endpoint: get_att("#{queue}.Arn"),
      topic_arn: ref(topic),
    )
  end
end