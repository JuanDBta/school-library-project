require './person'
require './rental'
require './book'

describe Person do
  # Arrange: Set up a common instance of Person for the tests
  let(:person) { Person.new(15, name: 'John Doe', parent_permission: true) }

  context 'when initializing a person' do
    it 'sets the attributes correctly' do
      expect(person.instance_variable_get(:@name)).to eq('John Doe')
      expect(person.instance_variable_get(:@age)).to eq(15)
      expect(person.instance_variable_get(:@parent_permission)).to be(true)
      expect(person.rentals).to be_empty
    end
  end

  context 'when checking if a person can use services' do
    it 'returns false without permission' do
      person.instance_variable_set(:@parent_permission, false)
      expect(person.can_use_services?).to be(false)
    end

    it 'returns false without permission' do
      # Arrange: Modify the person's permission to simulate a scenario
      person.instance_variable_set(:@parent_permission, false)
      # Act: No additional action required
      # Assert: Verify that the can_use_services method returns false
      expect(person.can_use_services?).to be(false)
    end
  end

  it 'returns correct name' do
    # Act: No specific action required, as the setup provides the name
    # Assert: Verify that the correct_name method returns the correct name
    expect(person.correct_name).to eq('John Doe')
  end

  describe '#of_age?' do
    it 'returns true when age is 18 or older' do
      # Arrange: Set the person's age to simulate the scenario
      person.age = 25
      # Act: Call the private method using send
      # Assert: Verify that the private method's result is true
      expect(person.send(:of_age?)).to be(true)
    end

    it 'returns false when age is under 18' do
      # Arrange: Set the person's age to simulate the scenario
      person.age = 15
      # Act: Call the private method using send
      # Assert: Verify that the private method's result is false
      expect(person.send(:of_age?)).to be(false)
    end
  end
  context 'when adding a rental to a book' do
    let(:book) { Book.new('A', 'B') }
    let(:person) { Person.new(15, name: 'John Doe', parent_permission: true) }
    let(:rental) { instance_double('Rental') }
    let(:date) { '01-01-1900' }

    before do
      allow(Rental).to receive(:new).with(date, book, person).and_return(rental)
      allow(rental).to receive(:date).and_return(date)
      allow(rental).to receive(:person).and_return(person)

      book.add_rental(date, person)
    end

    it 'adds the rental to the rentals array' do
      expect(book.rentals).to include(rental)
    end
  end
end
