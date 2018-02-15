module RecordsHelper
    require 'open-uri'

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

    def save_pitchers_info(records)
        records.css("tr").each_with_index do |player, i|
            next if i == 0
            pitcher_info = PitcherRecord.new
            #名前
            pitcher_info.name = player.css("td")[0].text
            #防御率
            if player.css("td")[17].text.to_f > 143
                pitcher_info.era = player.css("td")[1].text.to_f
            else
                pitcher_info.era = 99999                
            end
            #ホールド数
            if player.css("td")[11].text == "---"
                pitcher_info.hold = 0
            else
                pitcher_info.hold = player.css("td")[11].text.to_i
            end
            #セーブ数
            if player.css("td")[13].text == "---"
                pitcher_info.save_num = 0
            else
                pitcher_info.save_num = player.css("td")[13].text.to_i
            end
            #勝率
            if player.css("td")[14].text == "---"
                pitcher_info.win = 0
            else
                pitcher_info.win = player.css("td")[14].text.to_f
            end
            pitcher_info.save!
        end
    end
    
    def save_batters_info(records)
        records.css("tr").each_with_index do |player, i|
            next if i == 0
            batter_info = BatterRecord.new
            #名前
            batter_info.name = player.css("td")[0].text
            #打率
            batter_info.rate = player.css("td")[1].text.to_f
            #打席数
            batter_info.number = player.css("td")[3].text.to_i
            #安打数
            batter_info.hit = player.css("td")[5].text.to_i
            #OPS
            batter_info.ops = player.css("td")[21].text.to_f
            batter_info.save!
        end
    end
    
    #ダミー
    def get_dammy_pitchers_info
        pitcher_infos = []
        for num in 1..3 do
            pitcher_info = []
            #名前
            pitcher_info << num.to_s
            #防御率
            pitcher_info << 3.01                
            #ホールド数
            pitcher_info << num
            #セーブ数
            pitcher_info << num+3
            #勝率
            pitcher_info << num*1.3
            pitcher_infos << pitcher_info
        end
        return pitcher_infos
    end
    
    def get_dammy_batters_info
        batter_infos = []
        for num in 1..3 do
            batter_info = []
            #名前
            batter_info << num.to_s
            #打率
            batter_info << num*1.3
            #打席数
            batter_info << num*20
            #安打数
            batter_info << num*10
            #OPS
            batter_info << num*3.2
            batter_infos << batter_info
        end
        return batter_infos
    end

end
