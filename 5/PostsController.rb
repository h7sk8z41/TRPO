require_relative 'Resource'
require_relative 'DataSource'

class PostsController
  extend Resource

  def initialize
    @posts = DataSource.posts
  end

  def index
    puts 'All post'
    @posts.each{ |entity| puts entity.to_s}
  end

  def show
    puts 'Input index'
    requestedIndex = gets.chomp.to_i
    positionInArray = -1;
    @posts.each{ |entity, index|
      if(entity.id == requestedIndex)
        positionInArray = index
        puts entity.to_s
      end}

    if(positionInArray != -1)
      return positionInArray
    else
      puts 'Post not found'
    end

  end

  def create
    puts 'Input instance '
    print 'Header  = '
    title = gets.chomp
    print 'description  = '
    description = gets.chomp
    print 'author  = '
    author = gets.chomp
    newId = @posts.length + 1

    post = Post.new(newId, title, description, author)
    @posts.push(post)
    index()
  end

  def update
    puts 'Input index of instance which you want to update'
    requestedId = gets.chomp().to_i
    positionInArray = -1

    @posts.each{ |entity, index|
      if(entity.id == requestedId)
        positionInArray = index.to_i
      end
    }

    if(positionInArray != -1)
      puts 'Input new value for post'
      @posts[positionInArray].title = gets.chomp()
      @posts[positionInArray].description = gets.chomp()
      @posts[positionInArray].author = gets.chomp()

    else
      puts 'Post with this index not found'
    end

    index()
  end

  def destroy
    puts 'Input id of instance, which you want to delete'
    requestedId = gets.chomp.to_i
    positionInArray = -1

    @posts.each{
      |entity, index|
      if(entity.id == requestedId)
        positionInArray = index.to_i
      end
    }

    if(positionInArray != -1)
      @posts.delete_at(positionInArray)
    else
      puts "Instance with Id " + requestedId + "not found"
    end
  end
end
