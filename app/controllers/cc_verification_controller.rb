class CcVerificationController < ApplicationController

    def index
        @results = Ccresult.all
    end

    def new
        @cc_verification = CcVerification.new
    end

    # TO DO    
    # work on unit tests stuff

    def create
        # clean screen from previous verification
        Ccresult.delete_all                

        uploaded_file = params[:cards_file]
        # if user didn't send any file at all, abort
        if uploaded_file == nil
            return
        end

        first_line = true

        uploaded_file.read.each_line do |line|
            # skip first line as it isn't needed in rails environment
            if first_line
                first_line = false
                next
            end
            
            # r = Services::CardChecker.verify(line)
            is_credit_card_valid, explanation = Services::CardChecker.verify(line)

            Ccresult.create(creditcard: line, result: is_credit_card_valid, explanation: explanation)

        end
        redirect_to action: 'index'
    end

    def download
        @all = Ccresult.all
        result = ''
        @all.each do |row|
            result += row.result == 't' ? 'Valid' : 'Invalid'
            result += '<br />'
        end

        # send_data result, :filename => 'result.txt'     
        render inline: result   
    end

    def delete        
        Ccresult.delete_all
        redirect_to action: 'index'
    end

end
