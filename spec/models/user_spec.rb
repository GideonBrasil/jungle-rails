require 'rails_helper'

RSpec.describe User, type: :model do

  subject { 
    described_class.new(password: 'wofwof',
                           email: 'john@doe.com',
                           first_name: 'Mazli',
                                last_name: 'Barton',
                                password_confirmation: 'wofwof')
           }

  
  describe 'Validations' do

    it 'will only save to db if user contains password, password_confirmation, email, first_name and last_name' do
      expect(subject).to be_truthy
    end

    it 'is not valid without a first_name'
    it 'is not valid without a last_name'
    it 'is not valid without an email'
    it 'is not valid without a password'
    it 'is not valid without a password_confirmation'

  end

end
