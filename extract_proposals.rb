#!/usr/bin/env ruby

require 'github_api'
require 'csv'

puts 'Getting ready to extract conference proposals...'

puts 'Accessing repo...'

pull_requests = Github::PullRequests.new.list user: 'rubyaustralia', repo: 'rubyconfau-2014-cfp', per_page: 100
pull_requests = pull_requests.sort_by { |pr| pr["number"] }

puts "Found #{pull_requests.length} pull requests..."

CSV.open("extract.csv", "wb", headers: ['number', 'title', 'body']) do |csv|
  pull_requests.each do |pr|
    puts "About to extract data from pull request ##{pr['number']}..."
    csv << [ pr['number'], pr['title'], pr['body']]
  end
end

