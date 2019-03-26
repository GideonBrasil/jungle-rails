require 'rails_helper'

RSpec.describe User, type: :model do


  subject { 
    described_class.new(password: 'wofwof',
                           email: 'mazli@gmail.com',
                      first_name: 'Mazli',
                       last_name: 'Barton',
           password_confirmation: 'wofwof')
          }
  before do
    @user2 = User.new(password: 'wofwof',
                        email: 'MAZLI@gmail.com',
                    first_name: 'Mazli',
                    last_name: 'Barton',
        password_confirmation: 'wofwof')
  end
  
  describe 'Validations' do

    it 'will only save to db if user contains password, password_confirmation, email, first_name and last_name' do
      expect(subject.save).to be_truthy
    end

    it 'will not save to db if user password & password_confirmation aren"t the same' do
      subject.password_confirmation = 'wofwofwoff'
      expect(subject.save).to be_falsey
    end

    it 'will not save to db if user emails are already in the db not case_sesitive' do
      subject.save
      expect(@user2.save).to be_falsey
    end

    it 'is not valid without a first_name' do
      subject.first_name = nil
      subject.save
      expect(subject.errors.full_messages).to include "First name can't be blank"
    end

    it 'is not valid without a last_name' do
      subject.last_name = nil
      subject.save
      expect(subject.errors.full_messages).to include "Last name can't be blank"
    end

    it 'is not valid without an email' do
      subject.email = nil
      subject.save
      expect(subject.errors.full_messages).to include "Email can't be blank"
    end

    it 'is not valid without a password'
    it 'is not valid without a password_confirmation'

  end

end
