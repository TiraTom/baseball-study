class RecordsController < ApplicationController
    include RecordsHelper
    
    def index 
        #DBからデータ読み出し
        byebug
        @era_info = pitchers_info.order(:era)[0..2]
        @hold_info = pitchers_info.order(hold: :asc)[0..2]
        @save_info = pitchers_info.order(save_num: :asc)[0..2]
        @win_info = pitchers_info.order(win: :asc)[0..2]
        @batting_rate_info = batters_info.order(rate: :asc)[0..2]
        @batting_number_info = batters_info.order(number: :asc)[0..2]
        @hit_info = batters_info.order(hit: :asc)[0..2]
        @ops_info = batters_info.order(ops: :asc)[0..2]
   end
    
    #成績ページのデータの再取得
    def reload
        #ページ全体のデータ取得
        pitcher_all_records = get_pitcher_all_records
        batter_all_records = get_batter_all_records

        #DBに成績データ格納
        save_PitcherRecord(pitcher_all_records)
        save_BatterRecord(batter_all_records)
        
        redirect_to action: :index

    end
end
