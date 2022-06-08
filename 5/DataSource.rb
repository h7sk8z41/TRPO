class DataSource
  @posts = []
  @comments = []

  class << self
    attr_accessor :posts, :comments
  end
end
