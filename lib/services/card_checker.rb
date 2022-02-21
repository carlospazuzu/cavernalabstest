module Services
    class CardChecker

        def self.verify(card_number)            
            # remove empty spaces from string sides
            card_number.strip!

            # verification I - must start with 4, 5 or 6
            if not ['4', '5', '6'].include? card_number[0]
                return false, 'Does not start with 4, 5 or 6'
            end

            group_counter = 0

            # verification II - may have digits in groups of 4 separated by one hyphen '-'
            if card_number.include? '-'
                card_number.split('').each do |d|
                    
                    if [*'0'..'9'].include? d
                        group_counter += 1
                    end             

                    if d == '-'
                        if group_counter != 4
                            return false, 'Has an incorrect number of digits between hypens'
                        else
                            group_counter = 0
                        end
                    end                    
                end
            end

            # remove '-' as it is not need for further verifications
            card_number = card_number.gsub('-', '')

            # verification III - must only consist of digits (0-9) / must NOT use any other separator like ' ' , '_', etc. 
            card_number.split('').each do |d|
                if not [*'0'..'9'].include? d
                    return false, "Has characters other than (0-9) digits / must NOT use any other separator like ' ' , '_', etc."
                end
            end

            # verification IV - must contain exactly 16 digits
            if not card_number.length == 16
                return false, 'Contains a number of digits different from 16'
            end

            # verification V - must NOT have 4 or more consecutive repeated digits.
            is_first = true
            previous_digit = ''
            repetition_counter = 1

            card_number.split('').each do |d|
                if is_first
                    previous_digit = d
                    repetition_counter = 1
                    is_first = false
                    next
                end

                if d == previous_digit
                    repetition_counter += 1
                else
                    repetition_counter = 1                    
                end

                previous_digit = d

                if repetition_counter >= 4
                    return false, 'Has 4 or more consecutive repeated digits'
                end
            end

            # if it arrives here, it is a valid credit card number
            return true, nil
        end

    end
end