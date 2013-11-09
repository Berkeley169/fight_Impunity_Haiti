module Status
  def status_check(status)
    self.send(self.class.to_s.downcase.concat("_langs").to_sym).each do |pl|
      if pl.status == status
        return true
      end
    end
    return false
  end

  def published?
  	status_check('published')
  end
end