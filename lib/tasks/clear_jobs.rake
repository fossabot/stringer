desc 'Clear the sidekiq queue.'
task clear_jobs: :environment do
  # Delayed::Job.delete_all
end

