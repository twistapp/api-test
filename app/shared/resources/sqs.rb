class Sqs < Jets::Stack
  # Simple queues
  sqs_queue :analysis1
  sqs_queue :analysis2

  # Dead letter queues
  sqs_queue :analysis1_dl
  sqs_queue :analysis2_dl

  # Subscribe analysis1 and analysis2 queues to
  # :new_post sns topic.
  subscribe :new_post, :analysis1
  subscribe :new_post, :analysis2
end