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
# 梶裕貴さんのPixivページ
url = 'https://dic.pixiv.net/a/%E6%A2%B6%E8%A3%95%E8%B2%B4'

# put actor names into actors array
html = agent.get(url)
character = html.search('//*[@id="article-body"]/table[1]/tr/td/ul/li/a[1]').map(&:inner_text)
animation = html.search('//*[@id="article-body"]/table[1]/tr/td/ul/li/a[2]').map(&:inner_text)

# ばなにゃへのリンクがないため削除
character.delete('ばなにゃ')
character.delete('それいけ!アンパンマン')

# save as csv
CSV.open('db/csvs/pixiv_actor_梶裕貴.csv', 'w') do |csv|
  csv_row_array = [character, animation].transpose
  csv_row_array.each do |row|
    csv << row
  end
end

puts 'All tasks successfully done.'