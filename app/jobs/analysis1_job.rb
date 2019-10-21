class Analysis1Job < ApplicationJob
  class_timeout 30
  depends_on :sqs

  sqs_event(
    ref(:analysis1),
    queue_properties: {
      redrive_policy: {
        dead_letter_target_arn: ref(:analysis1_dl),
        max_receive_count: 3,
    }}
  )
  def analysis
    puts "analysis 1 executed"
  end

  sqs_event ref(:analysis1_dl)
  def dead_letter
    puts "dead letter called"
  end
end
