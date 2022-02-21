require 'rails_helper'

RSpec.describe "ValidatingCreditCardCheckers", type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'validates the credit card verification service with default test cases' do
    expect(Services::CardChecker.verify('4253625879615786')[0]).to eq(true)
    expect(Services::CardChecker.verify('4424424424442444')[0]).to eq(true)    
    expect(Services::CardChecker.verify('5122-2368-7954-3214')[0]).to eq(true)
    expect(Services::CardChecker.verify('42536258796157867')[0]).to eq(false)    
    expect(Services::CardChecker.verify('4424444424442444')[0]).to eq(false)    
    expect(Services::CardChecker.verify('5122-2368-7954 - 3214')[0]).to eq(false)
    expect(Services::CardChecker.verify('44244x4424442444')[0]).to eq(false)
    expect(Services::CardChecker.verify('0525362587961578')[0]).to eq(false)
    expect(Services::CardChecker.verify('4123456789123456')[0]).to eq(true)
    expect(Services::CardChecker.verify('5123-4567-8912-3456')[0]).to eq(true)    
    expect(Services::CardChecker.verify('61234-567-8912-3456')[0]).to eq(false)        
    expect(Services::CardChecker.verify('4123356789123456')[0]).to eq(true)
    expect(Services::CardChecker.verify('5133-3367-8912-3456')[0]).to eq(false)
    expect(Services::CardChecker.verify('5123 - 3567 - 8912 - 3456')[0]).to eq(false)
  end

  it 'validates the credit card verification service with custom test cases' do
    expect(Services::CardChecker.verify('44876532587695387')[1]).to eq('Contains a number of digits different from 16')
    expect(Services::CardChecker.verify('48759658235698579')[1]).to eq('Contains a number of digits different from 16')    
    expect(Services::CardChecker.verify('623597x457956231589')[1]).to eq("Has characters other than (0-9) digits / must NOT use any other separator like ' ' , '_', etc.")
    expect(Services::CardChecker.verify('4567-257-1245-12357')[1]).to eq("Has an incorrect number of digits between hypens")
    expect(Services::CardChecker.verify('4567-2572-2225-2357')[1]).to eq("Has 4 or more consecutive repeated digits")
    expect(Services::CardChecker.verify('4442986355555158')[1]).to eq('Has 4 or more consecutive repeated digits')
    expect(Services::CardChecker.verify('9856425781246639')[1]).to eq('Does not start with 4, 5 or 6')
  end
end
