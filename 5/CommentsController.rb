require_relative 'Resource'
require_relative 'DataSource'

class CommentsController
  extend Resource

  def initialize
    @comments = DataSource.comments
    @posts = DataSource.posts
  end

  def index
    puts 'Output all comments for all posts '
    @posts.each{ |entity| puts entity.to_s}
  end

  def create
    print 'Input id of article which you want to write comment'
    requestedId = gets.chomp.to_i
    positionInArray = -1

    @posts.each{ |entity, index|
      if(entity.id == requestedId)
        positionInArray = index
      end
    }

    if(positionInArray == -1)
      puts 'Post with this index not found'
      return
    end

    puts 'Input instance of comment'
    print ' text = '
    body = gets.chomp
    print 'author = '
    author = gets.chomp

    newId = @comments.length + 1

    @comments.push(Comments.new(newId, requestedId, body, author))
    index()
  end

  def index
    puts 'Output all comments'
    @comments.each{ |entity| puts entity.to_s}
  end

  def show
    puts 'Input index of comment, which you want get '
    requestedIndex = gets.chomp.to_i
    positionInArray = -1
    @comments.each{ |entity, index|
      if(entity.id == requestedIndex)
        positionInArray = index
        puts entity.to_s
      end}

    if(positionInArray != -1)
      return positionInArray
    else
      puts 'Comment not found'
    end

  end

  def update
    puts 'Input index of instance which you want to update'
    requestedId = gets.chomp().to_i
    positionInArray = -1

    @comments.each{ |entity, index|
      if(entity.id == requestedId)
        positionInArray = index.to_i
      end
    }

    if(positionInArray != -1)
      puts 'Input new value for comment'
      @comments[positionInArray].body = gets.chomp()
      @comments[positionInArray].author = gets.chomp()

    else
      puts 'Post with this index not found'
    end

    index()
  end

  def destroy
    puts 'Input id of instance, which you want to delete'
    requestedId = gets.chomp.to_i
    positionInArray = -1

    @comments.each{
      |entity, index|
      if(entity.id == requestedId)
        positionInArray = index.to_i
      end
    }

    if(positionInArray != -1)
      @comments.delete_at(positionInArray)
    else
      puts "Instance with Id " + requestedId + "not found"
    end
  end
end
