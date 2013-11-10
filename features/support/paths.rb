module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    # paths for canonical locations on the site
    when /^the home page$/ then '/'
    when /^the dashboard page$/ then '/dashboard'
    when /^the login page$/ then new_user_session_path
    when /^the logout page$/ then '/sessions/logout'
    when /^the user create page$/ then new_user_path
    when /^the manage tags page$/ then tags_path
#     when /^the user index page$/ then users_path
#     when /^the user edit page$/ then edit_user_path
    when /^the user index page$/ then dashboard_users_path
    when /^the user edit page$/ then edit_dashboard_user_path
    when /^the edit profile page$/ then '/dashboard/users/1/edit'
    when /^the password recovery page$/ then '/sessions/password/new'
    when /^the password page$/ then '/sessions/password'

    # Paths for showing items, lookup on the name field
    when /^the show picture page for "(.*)"$/
      p = Picture.where('name' => $1).first
      picture_path(p.id)
    when /^the show binary page for "(.*)"$/
      b = Binary.where('name' => $1).first
      binary_path(b.id)
    when /^the show text page for "(.*)"$/
      t = Text.where('name' => $1).first
      text_path(t.id)
    when /^the show sound page for "(.*)"$/
      s = Sound.where('name' => $1).first
      sound_path(s.id)
    when /^the show video page for "(.*)"$/
      v = Video.where('name' => $1).first
      video_path(v.id)
    when /^the show tag page for "(.*)"$/
      tag = Tag.where('english' => $1).first
      tag_path(tag.id)

    # Paths for editting items, lookup on the name field
    when /^the edit picture page for "(.*)"$/
      p = Picture.where('name' => $1).first
      edit_picture_path(p.id)
    when /^the edit binary page for "(.*)"$/
      b = Binary.where('name' => $1).first
      edit_binary_path(b.id)
    when /^the edit text page for "(.*)"$/
      t = Text.where('name' => $1).first
      edit_text_path(t.id)
    when /^the edit sound page for "(.*)"$/
      s = Sound.where('name' => $1).first
      edit_sound_path(s.id)
    when /^the edit video page for "(.*)"$/
      v = Video.where('name' => $1).first
      edit_video_path(v.id)
    when /^the edit tag page for "(.*)"$/
      tag = Tag.where('english' => $1).first
      edit_tag_path(tag.id)

    # Paths for visiting the new item page
    when /^the new binary page$/
      new_binary_path
    when /^the new picture page$/
      new_picture_path
    when /^the new sound page$/
      new_sound_path
    when /^the new text page$/
      new_text_path
    when /^the new video page$/
      new_video_path

    when /^the new text page for text type "(.*)"$/
      new_text_path(:subtype => $1)

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
