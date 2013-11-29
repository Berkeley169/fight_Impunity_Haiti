# This is the overching model which owns all of the other types
# This should remain fairly empty but we will use this so that every
# item in the library has a unique ID.
class Item < ActiveRecord::Base
  attr_accessible :type
  LANGUAGES = [:English, :French, :Creole, :Spanish]
  STATUSES = [:new, :pending, :in_progress, :published, :rejected]

  def self.status_options(user)
    if user.role == "Editor"
      opts = [:new, :in_progress, :pending]
    elsif user.role == "Manager"
      opts = Item::STATUSES
    end
    opts.map { |x| [x.to_s.humanize.titleize, x] }
  end
end
