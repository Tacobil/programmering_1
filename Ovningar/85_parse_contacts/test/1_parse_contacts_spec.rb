require_relative 'spec_helper'
require "fileutils"

FUNCTION = 'parse_contacts'
ARITY = 1
PATH = File.join(FUNCTION+".rb")
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
               "Du behöver definera funktionen #{FUNCTION} i #{PATH}")
  end

  it "takes #{ARITY.humanize} argument#{ARITY > 1 ? "s" : ""}" do
    message = "Funktionen #{FUNCTION} måste ta #{ARITY} argument"
    assert_equal ARITY, method(FUNCTION.to_sym).arity, message
  end

  it 'returnerar en array av hashes' do
    result = StudentMethods.send(FUNCTION, "./test/contacts/vanner.csv")
    assert_instance_of Array, result
    assert_instance_of Hash, result[0]
  end

  it 'parsar namn korrekt' do
    result = StudentMethods.send(FUNCTION, "./test/contacts/vanner.csv")
    assert_equal "Anna Andersson", result[0]["namn"]
    assert_equal "Erik Eriksson", result[1]["namn"]
  end

  it 'parsar telefonnummer korrekt' do
    result = StudentMethods.send(FUNCTION, "./test/contacts/vanner.csv")
    assert_equal "070-1234567", result[0]["telefon"]
  end

  it 'parsar e-post korrekt' do
    result = StudentMethods.send(FUNCTION, "./test/contacts/vanner.csv")
    assert_equal "anna@example.com", result[0]["epost"]
  end

  it 'hanterar alla rader' do
    result = StudentMethods.send(FUNCTION, "./test/contacts/vanner.csv")
    assert_equal 3, result.length
  end

  it 'returnerar tom array för tom fil' do
    result = StudentMethods.send(FUNCTION, "./test/contacts/tom.csv")
    assert_equal [], result
  end

end
