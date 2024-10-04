# spec/models/employee_spec.rb
require 'rails_helper'

RSpec.describe Employee, type: :model do
  let(:company) { Company.create!(name: 'Test Company', zip: '12345', city: 'City', state: 'State', address: '123 Main St', country: 'USA') }
  let(:coaching_program) { CoachingProgram.create!(name: 'Leadership Program', company: company) }
  let(:coach) { Coach.create!(name: 'John Doe', email: 'john@example.com') }

  subject do
    described_class.new(
      first_name: 'John', 
      last_name: 'Doe', 
      email: 'john.doe@example.com', 
      company: company, 
      coaching_program: coaching_program, 
      coach: coach
    )
  end

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a first name' do
      subject.first_name = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a last name' do
      subject.last_name = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without an email' do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid with a duplicate email' do
      described_class.create!(first_name: 'Jane', last_name: 'Doe', email: 'john.doe@example.com', company: company, coaching_program: coaching_program, coach: coach)
      expect(subject).to_not be_valid
    end

    it 'is not valid with an invalid email' do
      subject.email = 'invalid_email'
      expect(subject).to_not be_valid
    end

    it 'is valid without a phone number' do
      subject.phone = nil
      expect(subject).to be_valid
    end

    it 'is not valid with an invalid phone number format' do
      subject.phone = 'invalid_phone'
      expect(subject).to_not be_valid
    end
  end
end
