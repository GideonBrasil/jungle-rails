require 'rails_helper'

RSpec.describe User, type: :model do

  subject { 
    described_class.new(password: 'wofwof',
                           email: 'john@doe.com',
                      first_name: 'Mazli',
                       last_name: 'Barton',
           password_confirmation: 'wofwof')
          }

  # subject2 {
  #   described_class.new(password: 'wofwof',
  #                          email: 'mazli@gmail.com',
  #                     first_name: 'Mazli',
  #                      last_name: 'Barton',
  #          password_confirmation: 'wofwofwof')
  #           }
  
  describe 'Validations' do

    it 'will only save to db if user contains password, password_confirmation, email, first_name and last_name' do
      expect(subject.save).to be_truthy
    end

    it 'will not save to db if user password & password_confirmation aren"t the same' do
      subject.password_confirmation = 'wofwofwoff'
      expect(subject.save).to be_falsey
    end

    it 'is not valid without a first_name'
    it 'is not valid without a last_name'
    it 'is not valid without an email'
    it 'is not valid without a password'
    it 'is not valid without a password_confirmation'

  end

end
