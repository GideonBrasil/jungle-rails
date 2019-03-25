require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'Validations' do

    it 'will only save to db if user contains password, password_confirmation, email, first_name and last_name'
    it 'is not valid without a first_name'
    it 'is not valid without a last_name'
    it 'is not valid without an email'
    it 'is not valid without a password'
    it 'is not valid without a password_confirmation'

  end

end
