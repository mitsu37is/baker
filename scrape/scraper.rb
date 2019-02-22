# frozen_string_literal: true

require 'mechanize'
require 'logger'
require 'csv'

class Scraper
  def fetch(name)
    name = URI.escape(name)
    url = "https://dic.pixiv.net/a/" + name
    agent = Mechanize.new
    agent.robots = 'enabled'
    agent.user_agent_alias = 'Mac Safari'
    agent.log = Logger.new('scrape/pixiv_actor_log.txt')
    agent.get(url)
  end

  def analyze(html, xpath)
    chara_animes = html.search(xpath).map(&:inner_text)
    chara_animes.delete('')
    chara_animes = chara_animes.map(&:strip)
    character = []
    animation = []
    chara_animes.each do |chara_anime|
      m = chara_anime.match(/@|＠/)
      begin
        character << m.pre_match
        animation << m.post_match
      rescue NoMethodError
        next
      end
    end
    [character, animation]
  end

  def save_csv(chara_anime_array, name)
    CSV.open("db/csvs/pixiv_actor_#{name}.csv", 'w') do |csv|
      csv_row_array = chara_anime_array.transpose
      csv_row_array.each do |row|
        csv << row
      end
    end
    puts 'All tasks successfully done.'
  end

  def scrape(name, xpath)
    html = fetch(name)
    chara_anime_array = analyze(html, xpath)
    save_csv(chara_anime_array, name)
  end
end

scraper = Scraper.new()
actors = CSV.read('db/csvs/actor_names.csv')[0]
error_actors = []
actors.each do |actor_name|
  sleep 5
  puts 'Now scraping: ' + actor_name.delete(' ')
  begin
    scraper.scrape(actor_name.delete(' '), '//*[@id="article-body"]/table[1]/tr/td')
  rescue Mechanize::ResponseCodeError, NoMethodError
    error_actors.push(actor_name)
    next
  end
end