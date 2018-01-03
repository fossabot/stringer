desc 'Clear the delayed_job queue.'
task clear_jobs: :environment do
  Delayed::Job.delete_all
end
