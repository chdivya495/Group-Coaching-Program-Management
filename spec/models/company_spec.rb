# spec/models/company_spec.rb
require 'rails_helper'

RSpec.describe Company, type: :model do
  subject { described_class.new(name: 'Test Company', zip: '12345', city: 'City', state: 'State', address: '123 Main St', country: 'USA', website: 'http://example.com') }

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a zip code' do
      subject.zip = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid with a non-numerical zip code' do
      subject.zip = 'abcd'
      expect(subject).to_not be_valid
    end

    it 'is not valid without city, state, address, and country' do
      subject.city = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid with an invalid website URL' do
      subject.website = 'invalid_url'
      expect(subject).to_not be_valid
    end
  end
end
