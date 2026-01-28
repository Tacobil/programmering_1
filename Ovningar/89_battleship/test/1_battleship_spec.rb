require_relative 'spec_helper'

FUNCTION = 'battleship'
ARITY = 3
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

  it 'träffar 1.boards Hangarfartyg på 0,0' do
    StudentMethods.send(FUNCTION, "./boards/1.board", 0, 0).must_equal true
  end

  it 'missar 1.boards på 0,5' do
    StudentMethods.send(FUNCTION, "./boards/1.board", 0, 5).must_equal false
  end

  it 'missar 1.boards på 3,3' do
    StudentMethods.send(FUNCTION, "./boards/1.board", 3, 3).must_equal false
  end

  it 'träffar 1.boards Patrullbåt på 4,9' do
    StudentMethods.send(FUNCTION, "./boards/1.board", 4, 9).must_equal true
  end


  it 'returnerar "Spelplanen finns inte." om filen inte finns' do
    StudentMethods.send(FUNCTION, "boards/nuh-uh.board", 3, 3).must_equal "Spelplanen finns inte."
  end

  it 'returnerar "Felaktiga kordinater" om koordinaterna är utanför spelplanen' do
    [[-1, 0], [10, 10], [100, -5], [0, -1], [8, 12], [-32, 143]].each do |col, row|
      StudentMethods.send(FUNCTION, "./boards/1.board", col, row).must_equal "Felaktiga koordinater"
    end
  end


end
