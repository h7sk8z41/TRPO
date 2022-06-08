require_relative 'Resource'
require_relative 'DataSource'

class CommentsController
  extend Resource

  def initialize
    @comments = DataSource.comments
    @posts = DataSource.posts
  end

  def index
    puts 'Вывод всех комментарием к каждому посту '
    @posts.each{ |entity| puts entity.to_s}
  end

  def create
    print 'Введите идентификатор статьи к которой добавить комментарий'
    requestedId = gets.chomp.to_i
    positionInArray = -1

    @posts.each{ |entity, index|
      if(entity.id == requestedId)
        positionInArray = index
      end
    }

    if(positionInArray == -1)
      puts 'Поста с таким идентификатором найдено не было'
      return
    end

    puts 'Введите сущность комментария'
    print 'Введите содержимое комментария = '
    body = gets.chomp
    print 'Автор комментария = '
    author = gets.chomp

    newId = @comments.length + 1

    @comments.push(Comments.new(newId, requestedId, body, author))
    index()
  end

  def index
    puts 'Вывод всех комментариев постов'
    @comments.each{ |entity| puts entity.to_s}
  end

  def show
    puts 'Введите индекс комментария, который необходимо получить'
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
      puts 'Комментарий не был найден'
    end

  end

  def update
    puts 'Введите индекс сущности, которой необходимо обновить'
    requestedId = gets.chomp().to_i
    positionInArray = -1

    @comments.each{ |entity, index|
      if(entity.id == requestedId)
        positionInArray = index.to_i
      end
    }

    if(positionInArray != -1)
      puts 'Введите обновленные значения для поста'
      @comments[positionInArray].body = gets.chomp()
      @comments[positionInArray].author = gets.chomp()

    else
      puts 'По данному индексу не было найдено постов'
    end

    index()
  end

  def destroy
    puts 'Введите индентификатор сущности, которую необходимо удалить'
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
      puts "Элемент с Id " + requestedId + "не был найден"
    end
  end
end
