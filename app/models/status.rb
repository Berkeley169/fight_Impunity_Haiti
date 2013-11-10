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

  def new?
    status_check('new')
  end

  def in_progress?
    status_check('in_progress')
  end

  def pending?
    status_check('pending')
  end

  def rejected?
    status_check('rejected')
  end
end
