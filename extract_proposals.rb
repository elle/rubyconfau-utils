#!/usr/bin/env ruby

require 'github_api'
require 'csv'

puts 'Getting ready to extract conference proposals...'

pull_requests = Github::PullRequests.new.list user: 'rubyaustralia', repo: 'rubyconfau-2014-cfp', per_page: 100
pull_requests = pull_requests.sort_by { |pr| pr["number"] }

puts "Found #{pull_requests.length} pull requests..."

CSV.open("extract.csv", "wb", headers: ['number', 'title', 'body']) do |csv|
  pull_requests.each do |pr|
    csv << [ pr['number'], pr['title'], pr['body']]
    print '.'
  end
end

puts ''
puts "Done."
