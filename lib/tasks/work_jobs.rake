desc "Work the delayed_job queue."
task work_jobs: :environment do
  Delayed::Job.delete_all

  worker_retry = Integer(ENV["WORKER_RETRY"] || 3)
  worker_retry.times do
    Delayed::Worker.new(
        min_priority: ENV["MIN_PRIORITY"],
        max_priority: ENV["MAX_PRIORITY"]
    ).start
  end
end
