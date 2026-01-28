require_relative 'spec_helper'

FUNCTION = 'parse'
ARITY = 1
PATH = File.join("lib","tre_i_rad.rb")
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

  it 'omvandlar en plan till en tvådimensionell array' do
    board = [["x", "o", "x"], ["o", "x", "o"], ["o", "x", "x"]]
    StudentMethods.send(FUNCTION, "boards/1.board").must_equal [["x", "o", "x"], ["o", "x", "o"], ["o", "x", "x"]], "[[\"x\", \"o\", \"x\"],
      [\"o\", \"x\", \"o\"],
      [\"o\", \"x\", \"x\"]]"
  end

  it 'returnerar "Spelplanen finns inte." om filen inte finns' do
    StudentMethods.send(FUNCTION, "boards/nope.board").must_equal "Spelplanen finns inte."
  end

end
