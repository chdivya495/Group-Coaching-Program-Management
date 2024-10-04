# spec/models/coaching_program_spec.rb
require 'rails_helper'

RSpec.describe CoachingProgram, type: :model do
  let(:company) { Company.create!(name: 'Test Company', zip: '12345', city: 'City', state: 'State', address: '123 Main St', country: 'USA') }
  subject { described_class.new(name: 'Leadership Program', description: 'Program description', company: company) }

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a company' do
      subject.company = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid if the name is not unique within the same company' do
      described_class.create!(name: 'Leadership Program', description: 'Another description', company: company)
      expect(subject).to_not be_valid
    end
  end
end
