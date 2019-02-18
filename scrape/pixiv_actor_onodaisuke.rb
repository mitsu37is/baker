# frozen_string_literal: true

require 'mechanize'
require 'logger'
require 'csv'

# set up mechanize agent
agent = Mechanize.new
agent.robots = 'enabled'
agent.user_agent_alias = 'Mac Safari'
agent.log = Logger.new('scrape/pixiv_actor_log.txt')

# prepare url
# 小野大輔さんのPixivページ
url = 'https://dic.pixiv.net/a/%E5%B0%8F%E9%87%8E%E5%A4%A7%E8%BC%94'

# put actor names into actors array
html = agent.get(url)
character = html.search('//*[@id="article-body"]/table[1]/tr/td/ul/li/a[1]').map(&:inner_text)
animation = html.search('//*[@id="article-body"]/table[1]/tr/td/ul/li/a[2]').map(&:inner_text)

# キノへのリンクがないため削除
character.delete('キノの旅')

# save as csv
CSV.open('db/csvs/pixiv_actor_小野大輔.csv', 'w') do |csv|
  csv_row_array = [character, animation].transpose
  csv_row_array.each do |row|
    csv << row
  end
end

puts 'All tasks successfully done.'