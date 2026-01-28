require_relative 'spec_helper'
require "fileutils"

FUNCTION = 'word_frequency'
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

  it 'räknar ordfrekvens korrekt' do
    result = StudentMethods.send(FUNCTION, "./test/files/text1.txt")
    assert_equal 3, result["hej"]
    assert_equal 2, result["på"]
    assert_equal 1, result["dig"]
  end

  it 'hanterar gemener och versaler som samma ord' do
    result = StudentMethods.send(FUNCTION, "./test/files/text2.txt")
    assert_equal 3, result["ruby"]
  end

  it 'returnerar tom hash för tomma filer' do
    result = StudentMethods.send(FUNCTION, "./test/files/tom.txt")
    assert_equal({}, result)
  end

  it 'hanterar flera radbrytningar' do
    result = StudentMethods.send(FUNCTION, "./test/files/text3.txt")
    assert_equal 2, result["rad"]
    assert_equal 2, result["en"]
  end

end
