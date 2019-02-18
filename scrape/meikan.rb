# frozen_string_literal: true

require 'mechanize'
require 'logger'
require 'csv'

# set up mechanize agent
agent = Mechanize.new
agent.robots = 'enabled'
agent.user_agent_alias = 'Mac Safari'
agent.log = Logger.new('scrape/log.txt')

# prepare urls
urls = ['http://seigura.com/enjoy/directory']
(2..80).each do |page_number|
  urls << "http://seigura.com/enjoy/directory/page/#{page_number}"
end

# put actor names into actors array
actors = []
urls.each do |url|
  puts 'sleeping for 5 seconds ......'
  sleep(5)
  puts 'wake up and start to work!'
  html = agent.get(url)
  actors.concat(html.search('//h3/a/b/span').map(&:inner_text))
end

# save as csv
CSV.open('db/csvs/actor_names.csv', 'w') do |csv|
  csv << actors
end
puts 'All tasks successfully done.'