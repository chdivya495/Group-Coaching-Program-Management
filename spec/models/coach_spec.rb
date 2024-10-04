# spec/models/coach_spec.rb
require 'rails_helper'

RSpec.describe Coach, type: :model do
  subject { described_class.new(name: 'John Doe', email: 'john@example.com') }

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without an email' do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid with a duplicate email' do
      described_class.create(name: 'Jane Doe', email: 'john@example.com')
      expect(subject).to_not be_valid
    end

    it 'is not valid with an invalid email format' do
      subject.email = 'invalid_email'
      expect(subject).to_not be_valid
    end
  end
end
