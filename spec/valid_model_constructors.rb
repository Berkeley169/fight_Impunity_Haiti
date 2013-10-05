module ValidModelConstructors
  def construct_valid_picture(name="ButtPirate")
    p = Picture.new(:name => name)
    p.pic_file_name = "file.jpg"
    p.save!
    return p
  end

  def construct_valid_text()
    t = Text.new()
    t.save!
    return t
  end
  def construct_valid_video()
    v = Video.new
    v.save!
    return v

  end
end