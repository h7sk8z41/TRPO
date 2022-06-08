class Post
  attr_accessor :id, :title, :description, :author

  def initialize(id, title, description, author)
    @id = id.to_i
    @title = title
    @description = description
    @author = author
  end

  def to_s
    puts "Id:#{@id} | Title:#{@title} | Description:#{description} | Author:#{author}"
  end
end
