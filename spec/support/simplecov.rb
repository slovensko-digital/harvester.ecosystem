require 'simplecov'

SimpleCov.start do
  unless ENV['CC_TEST_REPORTER_ID']
    coverage_dir File.join(Rails.root, 'tmp', 'coverage')
  end
end
