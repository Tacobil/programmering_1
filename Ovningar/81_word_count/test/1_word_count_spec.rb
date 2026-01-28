require_relative 'spec_helper'

FUNCTION = 'word_count'
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
               "Du behöver definera funktionen #{FUNCTION} i #{PATH}")  end

  it "takes #{ARITY.humanize} argument#{ARITY > 1 ? "s" : ""}" do
    message = "Funktionen #{FUNCTION} måste ta #{ARITY} argument"
    assert_equal ARITY, method(FUNCTION.to_sym).arity, message
  end

  it 'räknar ord i enklare filer' do
    StudentMethods.send(FUNCTION, "./test/files/fil1.txt").must_equal 7
  end

  it 'räknar ord i filer med mer avancerad struktur' do
    StudentMethods.send(FUNCTION, "./test/files/fil2.txt").must_equal 26
  end

  it 'returnerar 1 för filer utan mellanrum' do
    StudentMethods.send(FUNCTION, "./test/files/fil3.txt").must_equal 1
  end

  it 'returnerar 0 för filer utan ord' do
    StudentMethods.send(FUNCTION, "./test/files/fil4.txt").must_equal 0
  end


end
