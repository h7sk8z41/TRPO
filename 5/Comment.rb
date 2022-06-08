class Comments
  attr_accessor :id, :postId, :body, :author

  def initialize(id, postId, body, author)
    @id = id.to_i
    @postId = postId
    @body = body
    @author = author
  end

  def to_s
    puts "Id:#{@id} | PostId:#{@postId} | Body:#{@body} | Author:#{author}"
  end
end
