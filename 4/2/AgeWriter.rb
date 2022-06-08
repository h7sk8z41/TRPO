class AgeWriter

    def main()

        printStudents = false
        studentsCount = 0
        appropriateStudentCount = 0

        result = File.new("rubycourse/4/2/Result")
        while(true)
            puts "Введите ваш возраст"
            data = gets.chomp.to_i();

            File.foreach('rubycourse/4/2/example').with_index do |content, index|

                if (content.include?(data.to_s))
                    result.puts(content)
                    appropriateStudentCount += 1
                end
                studentsCount = index
            end
            puts "Чтобы продолжать работу введите y"
            puts "\n Подолжить? \n"
            data = gets.chomp()

            if(data != "y")
                result.close()
                break
            end
        end

        puts "Чтобы вывести всех студентов без побочного условия введите -1"
        if(gets.chomp() == "-1" || appropriateStudentCount == studentsCount)
            puts "Вывод найденных студентов"
            File.foreach('rubycourse/4/2/Result').with_index do |content, index|
                puts content
            end
        end
    end

end

worker = AgeWriter.new()
worker.main()
