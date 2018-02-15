class RecordsController < ApplicationController
    include RecordsHelper
    
    def index 
        #DBからデータ読み出し
        @era_info = PitcherRecord.order(era: :asc)[0..2]
        @hold_info = PitcherRecord.order(hold: :desc)[0..2]
        @save_info = PitcherRecord.order(save_num: :desc)[0..2]
        @win_info = PitcherRecord.order(win: :desc)[0..2]
        @batting_rate_info = BatterRecord.order(rate: :desc)[0..2]
        @batting_number_info = BatterRecord.order(number: :desc)[0..2]
        @hit_info = BatterRecord.order(hit: :desc)[0..2]
        @ops_info = BatterRecord.order(ops: :desc)[0..2]
    end
    
    #成績ページのデータの再取得
    def reload
        #ページ全体のデータ取得
        pitcher_all_records = get_pitcher_all_records
        batter_all_records = get_batter_all_records

        #DBに成績データ格納
        save_pitchers_info(pitcher_all_records)
        save_batters_info(batter_all_records)
        
        redirect_to action: :index

    end
end
