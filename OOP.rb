# A simple Library Management System for Ruby OOP Practice

class Book
  attr_accessor :title, :author, :available

  def initialize(title, author)
    @title = title
    @author = author
    @available = true
  end

  def borrow_book
    if @available
      @available = false
      puts "#{@title} has been borrowed."
    else
      puts "#{@title} is already borrowed."
    end
  end

  def return_book
    if !@available
      @available = true
      puts "#{@title} has been returned."
    else
      puts "#{@title} is already available."
    end
  end

  def available?
    @available
  end

  def display_details
    status = @available ? "Available" : "Borrowed"

    puts "Title : #{@title}"
    puts "Author: #{@author}"
    puts "Status: #{status}"
  end
end

class Member
  attr_reader :name, :borrowed_books

  MAX_BOOKS = 5

  def initialize(name)
    @name = name
    @borrowed_books = []
  end

  def borrow_book(book)
    if @borrowed_books.size >= MAX_BOOKS
      puts "#{@name} cannot borrow more than #{MAX_BOOKS} books."
      return
    end

    if book.available?
      book.borrow_book
      @borrowed_books << book
    else
      puts "Book is not available."
    end
  end

  def return_book(book)
    if @borrowed_books.include?(book)
      book.return_book
      @borrowed_books.delete(book)
    else
      puts "#{@name} never borrowed this book."
    end
  end

  def display_details
    puts "Member: #{@name}"
    puts "Books Borrowed: #{@borrowed_books.size}"
  end

  def display_borrowed_books
    puts "\nBooks borrowed by #{@name}"

    if @borrowed_books.empty?
      puts "No books borrowed."
      return
    end

    @borrowed_books.each do |book|
      book.display_details
    end
  end
end

class Librarian
  attr_reader :books, :members

  @@book_count = 0
  @@member_count = 0

  def initialize
    @books = []
    @members = []
  end

  def add_book(title, author)
    @books << Book.new(title, author)
    @@book_count += 1
  end

  def add_member(name)
    @members << Member.new(name)
    @@member_count += 1
  end

  def remove_book(book)
    if book.available?
      @books.delete(book)
      @@book_count -= 1
      puts "Book removed."
    else
      puts "Cannot remove a borrowed book."
    end
  end

  def remove_member(member)
    @members.delete(member)
    @@member_count -= 1
  end

  def display_all_books
    puts "\nBOOKS"
    puts "Total Books: #{@@book_count}"

    @books.each do |book|
      book.display_details
    end
  end

  def display_all_members
    puts "\nMEMBERS"
    puts "Total Members: #{@@member_count}"

    @members.each do |member|
      member.display_details
    end
  end
end

# Main

library = Librarian.new

# Add Books
library.add_book("Ruby Basics", "Yukihiro Matsumoto")
library.add_book("Harry Potter", "J.K. Rowling")
library.add_book("The Hobbit", "J.R.R. Tolkien")

# Add Members
library.add_member("Arham")
library.add_member("Ali")

book1 = library.books[0]
book2 = library.books[1]
book3 = library.books[2]

member1 = library.members[0]
member2 = library.members[1]

puts "\nInitial Library"
library.display_all_books

puts "\n"
puts "Arham borrows Ruby Basics"
member1.borrow_book(book1)

puts "\nArham borrows Harry Potter"
member1.borrow_book(book2)

puts "\nAli tries to borrow Ruby Basics"
member2.borrow_book(book1)

puts "\n"
member1.display_borrowed_books

puts "\n"
puts "Arham returns Ruby Basics"
member1.return_book(book1)

puts "\nAli borrows Ruby Basics"
member2.borrow_book(book1)

puts "\n"
library.display_all_books

puts "\n"
library.display_all_members

puts "\n"
member1.display_borrowed_books

puts "\n"
member2.display_borrowed_books