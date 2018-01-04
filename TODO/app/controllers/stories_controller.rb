class Stringer < Sinatra::Base
  post "/stories/mark_all_as_read" do
    MarkAllAsRead.new(params[:story_ids]).mark_as_read

    redirect to("/news")
  end
end
