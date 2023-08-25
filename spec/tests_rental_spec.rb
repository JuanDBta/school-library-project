require './rental'

describe Rental do
  let(:date) { '2023-08-24' }

  context 'when initializing a rental' do
    it 'sets attributes correctly and updates related objects' do
      # Arrange: Create mock instances for book and person
      book = instance_double('Book', rentals: [])
      person = instance_double('Person', rentals: [])

      # Act: Create a rental instance
      rental = Rental.new(date, book, person)

      # Assert: Verify attributes are set correctly
      expect(rental.date).to eq(date)
      expect(rental.book).to eq(book)
      expect(rental.person).to eq(person)

      # Verify that the rental is added to book's rentals and person's rentals
      expect(book.rentals).to include(rental)
      expect(person.rentals).to include(rental)
    end
  end
end
