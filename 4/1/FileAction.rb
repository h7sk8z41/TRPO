class FileAction

  def initialize(filePath)
    @filePath = filePath
  end

  def index()
    file = File.open(@filePath)
    puts file.readlines.map(&:chomp)

    file.close()
  end

  def find(id)
    file = File.open(@filePath)
    result = file.read().split("\n")

    file.close()

    puts result[id]
  end

  def where(pattern)
    resultArr = Array.new()
    File.foreach(@filePath).with_index do |content, index|
      if (content.include?(pattern))
        file = File.open(@filePath)
        result = file.read().split("\n")
        resultArr.push(result[index])
      end
    end
    return resultArr
  end

  def update(id, text)
    bufferFileName = 'buffer'
    file = File.open(bufferFileName, 'w')
    File.foreach(@filePath).with_index do |content, index|
      file.puts(id == index ? text : content)
    end

    file.close()

    File.write(@filePath, File.read(bufferFileName))
    File.delete(bufferFileName) if File.exist?(bufferFileName)
  end

  def delete(id)
    name = '1'
    file = File.open(name, 'w')
    File.foreach(@filePath).with_index do |content, index|
      if (id != index)
        file.puts(content)
      end
    end

    file.close()

    File.write(@filePath, File.read(name))
    File.delete(name) if File.exist?(name)
  end

end

file = FileAction.new("rubycourse/4/1/example")
file.index()
puts "Line with index 1"
file.find(1)
puts "Line(s) with letter M"
arr = file.where('M')
for i in arr
  puts i
end
file.update(2,'Zina 22')
file.delete(0)