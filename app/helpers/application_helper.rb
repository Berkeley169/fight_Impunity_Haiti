module ApplicationHelper
  def get_locale
    I18n.locale
  end

  def locale_to_word(locale = I18n.locale)
    if locale == :en
      :English
    elsif locale == :fr
      :French
    elsif locale == :es
      :Spanish
    elsif locale == :ht
      :Creole
    else
      :English
    end 
  end

  # TODO: change these helpers to be localized
  def pretty_date(date)
    if date.today?
      return t(:today)
    elsif date.to_date == Date.yesterday
      return t(:yesterday)
    else
      return date.strftime("%b %d, %Y")
    end
  end

  def doc_description(document)
    document.send((document.class.to_s.downcase + "_langs").to_sym).each do |dl|
      if !dl.description.nil?
        return dl.description
      end
    end
    return "No description available"
  end
  
  def doc_title(document)
    document.send((document.class.to_s.downcase + "_langs").to_sym).each do |dl|
      if !dl.title.nil?
        return dl.title
      end
    end
  end 

  def current_locale? locale, element
    get_locale == element.to_sym || locale == element
  end

  def current_locale_class(locale, element)
    return 'active' if get_locale.nil? && locale.nil? && element == 'en' || 
                       get_locale == element.to_sym ||
                       locale == element
  end
end
