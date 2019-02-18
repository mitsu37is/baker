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
# 神谷浩史さんのPixivページ
url = 'https://dic.pixiv.net/a/%E7%A5%9E%E8%B0%B7%E6%B5%A9%E5%8F%B2'

# put actor names into actors array
html = agent.get(url)
character = html.search('//*[@id="article-body"]/table[1]/tr/td/ul/li/a[1]').map(&:inner_text)
animation = html.search('//*[@id="article-body"]/table[1]/tr/td/ul/li/a[2]').map(&:inner_text)

# 超GALS!寿蘭へのリンクがないため削除
character.delete('超GALS!寿蘭')

# save as csv
CSV.open('db/csvs/pixiv_actor_神谷浩史.csv', 'w') do |csv|
  csv_row_array = [character, animation].transpose
  csv_row_array.each do |row|
    csv << row
  end
end

puts 'All tasks successfully done.'