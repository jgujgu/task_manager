require 'bundler'
Bundler.require

ENV['TASK_MANAGER_ENV'] ||= 'test'

require File.expand_path("../../config/environment", __FILE__)
require 'minitest/autorun'
require 'capybara'
require 'tilt/erb'

class ModelTest < Minitest::Test
  def teardown
    TaskManager.delete_all
  end
end

Capybara.app = TaskManagerApp

class FeatureTest < Minitest::Test
  include Capybara::DSL

  def teardown
    TaskManager.delete_all
  end
end
