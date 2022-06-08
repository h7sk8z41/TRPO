require_relative 'Resource'
require_relative 'DataSource'

class PostsController
  extend Resource

  def initialize
    @posts = DataSource.posts
  end

  def index
    puts 'Вывод всех постов'
    @posts.each{ |entity| puts entity.to_s}
  end

  def show
    puts 'Введите индекс'
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
      puts 'Пост не был найден'
    end

  end

  def create
    puts 'Введите сущность '
    print 'Заголовок статьи = '
    title = gets.chomp
    print 'Описание статьи = '
    description = gets.chomp
    print 'Автор статьи = '
    author = gets.chomp
    newId = @posts.length + 1

    post = Post.new(newId, title, description, author)
    @posts.push(post)
    index()
  end

  def update
    puts 'Введите индекс сущности, которой необходимо обновить'
    requestedId = gets.chomp().to_i
    positionInArray = -1

    @posts.each{ |entity, index|
      if(entity.id == requestedId)
        positionInArray = index.to_i
      end
    }

    if(positionInArray != -1)
      puts 'Введите обновленные значения для поста'
      @posts[positionInArray].title = gets.chomp()
      @posts[positionInArray].description = gets.chomp()
      @posts[positionInArray].author = gets.chomp()

    else
      puts 'По данному индексу не было найдено постов'
    end

    index()
  end

  def destroy
    puts 'Введите индентификатор сущности, которую необходимо удалить'
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
      puts "Элемент с Id " + requestedId + "не был найден"
    end
  end
end
