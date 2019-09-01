require 'simplecov'

SimpleCov.start 'rails' do
  add_filter 'spec'
  add_filter 'jobs'
  add_filter 'channels'
  add_filter 'mailers'

  groups = %w[controllers models validators concepts endpoints]
  groups.each { |name| add_group name.capitalize, "/app/#{name}" }

  minimum_coverage 95
end
