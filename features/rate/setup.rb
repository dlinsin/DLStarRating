class Setup
  def self.before
    # do useful stuff
    yield
  end
  
  def self.after
    # clean up
  end
end