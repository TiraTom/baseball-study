module RecordsHelper
    require 'open-uri'
    require 'nokogiri'
    
    def get_pitcher_all_records
        url = "https://www.yakult-swallows.co.jp/players/stats/pitcher"
        charset = nil
        html = open(url) do |f|
            charset = f.charset
            f.read
        end
        Nokogiri::HTML.parse(html, nil, charset)
    end
    
    def get_batter_all_records
        url = "https://www.yakult-swallows.co.jp/players/stats/batter"
        charset = nil
        html = open(url) do |f|
            charset = f.charset
            f.read
        end
        Nokogiri::HTML.parse(html, nil, charset)
    end

    def get_pitchers_info(records)
        pitcher_infos = []
        records.css("tr").each_with_index do |player, i|
            next if i == 0
            pitcher_info = []
            #名前
            pitcher_info << player.css("td")[0].text
            #防御率
            pitcher_info << player.css("td")[1].text
            #ホールド数
            pitcher_info << player.css("td")[11].text
            #セーブ数
            pitcher_info << player.css("td")[13].text
            #勝率
            pitcher_info << player.css("td")[14].text
            pitcher_infos << pitcher_info
        end
        return pitcher_infos
    end
    
    def get_batters_info(records)
        batter_infos = []
        records.css("tr").each_with_index do |player, i|
            next if i == 0
            batter_info = []
            #名前
            batter_info << player.css("td")[0].text
            #打率
            batter_info << player.css("td")[1].text
            #打席数
            batter_info << player.css("td")[3].text
            #OPS
            batter_info << player.css("td")[21].text
            batter_infos << batter_info
        end
        return batter_infos
    end
    
end
