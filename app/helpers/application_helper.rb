module ApplicationHelper
  # Returns a formatted timestamp such as "3 hours ago"
  def time_ago(time)
    time_ago_in_words(time) + ' ago'
  end
end