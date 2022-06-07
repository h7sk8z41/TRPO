class FileAction
  def initialize(file)
    @file = file
  end
  def index
    file = File.open(@file)
    puts file.readlines.map(&:chomp)
  end
  def find (id)

  end
  def where(pattern)

  end
  def update(id,text)

  end
  def delete(id)

  end
end