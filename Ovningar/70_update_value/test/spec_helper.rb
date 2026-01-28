require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/fail-fast'
require 'mocha/minitest'
require 'humanize'
require 'securerandom'
Minitest::Reporters.use!(Minitest::Reporters::SpecReporter.new)
$VERBOSE = nil
