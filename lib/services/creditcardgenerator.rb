module Services
    class CreditCardGenerator

        def self.generate_random

            rnd = Random.new
            chosen_number = rnd.rand(4) + 1
            credit_card = ''

            alphabet = [*'a'..'z']
            digits = [*'0'..'9']
            
            case chosen_number
            # generates a sequence of 16 random numbers
            when 1
                credit_card += ['4', '5', '6'].sample
                15.times do
                    credit_card += digits.sample
                end
            # generate a sequence of numbers with a non digit character
            when 2
                credit_card += ['4', '5', '6'].sample
                15.times do
                    chance = rnd.rand(100) + 1
                    if chance <= 5
                        credit_card += alphabet.sample
                    else
                        credit_card += digits.sample
                    end
                end
            # generates a wrong number of digit characters for a valid credit card
            when 3
                [15, 17, 20].sample.times do
                    credit_card += digits.sample
                end
            # generate a sequence separated by an hyphen 
            when 4
                counter = 0
                while counter < 4
                    chance  = rnd.rand(100)
                    if chance < 15
                        credit_card += digits.sample * 4                        
                    else
                        4.times do
                            credit_card += digits.sample
                        end
                    end
                    
                    if counter < 3
                        credit_card += '-'
                    end
                    counter += 1
                end
            end

            return credit_card
        end

    end
end