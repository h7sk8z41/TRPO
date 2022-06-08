class Balance
    def initialize()
        @fileName = 'rubycourse/4/3/Balance'
        if(File.exist?(@fileName))
            @file = File.open(@fileName)
        else
            @file = File.new(@fileName, 'w')
            @file.puts('250.0')
        end

        @currentBalance = @file.readlines.map(&:chomp)[0].to_f
        @file.close()
    end

    def main()
        puts 'Balance : ' + @currentBalance.to_s

        while(true)
            puts 'Input operation'
            puts 'D - deposit'
            puts 'W - withdraw'
            puts 'B - check your balance'
            puts 'Q - Quit'

            operation = gets.chomp();

            if (operation == 'D' || operation == 'd')
                puts 'Input count'
                amount = gets.chomp().to_f
                puts amount
                deposit(amount)
            elsif (operation == 'W'|| operation == 'w')
                puts 'input amount to withdraw'
                amount = gets.chomp().to_f
                withdraw(amount)
            elsif (operation == 'B'|| operation == 'b')
                puts 'Current balance ' + @currentBalance.to_s
            elsif (operation == 'Q'|| operation == 'q')
                saveBalance()
                break
            else
                puts 'Error! Invalid operation ' + operation.to_s
            end
        end
    end

    def saveBalance()
        puts 'Saving balance'
        @file = File.open(@fileName, 'w')
        @file.write(@currentBalance)
        puts 'Balance was successfuly saved'
    end

    def withdraw(amount)
        if (amount > @currentBalance)
            puts 'not enough money'
            return;
        end

        @currentBalance -= amount
        puts 'Balance : ' + @currentBalance.to_s
    end

    def deposit(amount)
        puts 'Balance = ' + @currentBalance.to_s

        if(@currentBalance <= 0)
            puts 'not enough money'
            return;
        end

        puts 'new deposit: ' + amount.to_s

        @currentBalance += amount
        puts 'New balance ' + @currentBalance.to_s
    end


end

balance = Balance.new()
balance.main()
