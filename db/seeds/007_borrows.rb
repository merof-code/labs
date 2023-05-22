# create random date from given date to now
def generate_random_date(from:, to:)
  random_seconds = rand((from.to_time.to_i)..(to.to_time.to_i))
  DateTime.strptime(random_seconds.to_s, '%s')
end

def pick_a_book(from)
  loop do
    physical_book = PhysicalBook.random
    return if physical_book.available_for_borrow_at(from)
  end
end

# creates random borrow for user
def create_random_borrow(user:)
  from = user.created_at
  random_date = generate_random_date(from:, to: DateTime.now)
  Borrow.create(
    physical_book: pick_a_book(from),
    user:,
    approver: Librarian.random,
    return_inspector: Librarian.random,
    borrow_date: random_date,
    scheduled_return_date: from + 14,
    returned_at: from + 12
  )
end

puts 'seeding borrows'
User.all.each do |u|
  next if rand < 0.5 # magic for bool

  rand(1..5).times do
    create_random_borrow(user: u)
    # create_extection if rand < 0.1
  end
end
