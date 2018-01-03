desc "Clean up old stories that are read and unstarred"
task :cleanup_old_stories, :number_of_days do |_t, args| # TODO: add :environment
  args.with_defaults(number_of_days: 30)
  RemoveOldStories.remove!(args[:number_of_days].to_i)
end
