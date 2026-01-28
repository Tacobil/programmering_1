require_relative 'spec_helper'

FUNCTION = 'valid_moves'
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

  it 'Hittar 0 platser i en fylld spelplan' do
    board = [["x", "o", "x"], ["o", "x", "o"], ["o", "x", "x"]]
    StudentMethods.send(FUNCTION, board).must_equal []
  end

  it 'Hittar rätt koordinat för 1 tom plats' do
    board = [["x", "o", "x"], ["o", "x", "o"], ["o", "-", "x"]]
    result = StudentMethods.send(FUNCTION, board)
    assert_equal 1, result.length, "Spelplan: #{board}"
    assert_equal 1, result[0]["x"], "x-koordinaten ska vara 1"
    assert_equal 0, result[0]["y"], "y-koordinaten ska vara 0"
  end

  it 'Hittar flera koordinater när det finns flera tomma platser' do
    board = [["-", "o", "x"], ["o", "-", "o"], ["o", "-", "x"]]
    result = StudentMethods.send(FUNCTION, board)
    assert_equal 3, result.length, "Spelplan: #{board}"

    # Sortera resultatet för jämförelse
    sorted = result.sort_by { |h| [h["y"], h["x"]] }
    assert_equal 1, sorted[0]["x"]
    assert_equal 0, sorted[0]["y"]
    assert_equal 1, sorted[1]["x"]
    assert_equal 1, sorted[1]["y"]
    assert_equal 0, sorted[2]["x"]
    assert_equal 2, sorted[2]["y"]
  end

  it 'Returnerar hashes med nycklarna "x" och "y"' do
    board = [["x", "o", "x"], ["o", "x", "o"], ["o", "-", "x"]]
    result = StudentMethods.send(FUNCTION, board)
    assert_instance_of Hash, result[0], "Varje koordinat ska vara en hash"
    assert result[0].key?("x"), "Hashen ska ha nyckeln 'x'"
    assert result[0].key?("y"), "Hashen ska ha nyckeln 'y'"
  end

end
