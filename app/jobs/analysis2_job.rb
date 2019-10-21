class Analysis2Job < ApplicationJob
  class_timeout 30
  depends_on :sqs

  sqs_event(
    ref(:analysis2),
    queue_properties: {
      redrive_policy: {
        dead_letter_target_arn: ref(:analysis2_dl),
        max_receive_count: 3,
    }}
  )
  def analysis
    puts "analysis 2 executed"
  end

  sqs_event ref(:analysis2_dl)
  def dead_letter
    puts "dead letter called"
  end
end
