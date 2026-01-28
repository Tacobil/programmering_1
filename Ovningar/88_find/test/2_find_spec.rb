require_relative 'spec_helper'

FUNCTION = 'find'
ARITY = 2
PATH = File.join("lib","find.rb")
RELATIVE_PATH = File.join("..", PATH)
STARTING_DIR = Dir.pwd

describe FUNCTION do

  def self.test_order
    :alpha
  end

  before do
    Dir.chdir(STARTING_DIR)
  end

  module StudentMethods; end

  def wrap_function_in_namespace
      StudentMethods.module_eval(File.read(PATH), __FILE__, __LINE__)
  end

  it 'exists' do
    assert File.exist?(PATH), "Du behöver skapa filen #{PATH}"
    require_relative RELATIVE_PATH
  end

  it "has a function named #{FUNCTION}" do
    wrap_function_in_namespace
    assert(StudentMethods.instance_methods.include?(FUNCTION.to_sym),
               "Du behöver definera funktionen #{FUNCTION} i #{PATH}")  end

  it "takes #{ARITY.humanize} argument#{ARITY > 1 ? "s" : ""}" do
    message = "Funktionen #{FUNCTION} måste ta #{ARITY} argument"
    assert_equal ARITY, method(FUNCTION.to_sym).arity, message
  end

  it 'hittar det första ordet i en bok' do
    StudentMethods.send(FUNCTION, [["The", "Banana"],["is", "great"]], "The").must_equal [0, 0]
  end

  it 'hittar det ord långt in i böcker' do
    book = parse("books/pride_and_prejudice.txt")
    StudentMethods.send(FUNCTION, book, "ill-breeding,").must_equal [6972, 9]
  end

  it 'funkar med tomma böcker' do
    empty = []
    StudentMethods.send(FUNCTION, empty, "wat").must_equal []
  end

end
