class RecordsController < ApplicationController
    include RecordsHelper
    
    def index 
        #DBからデータ読み出し
        @era_info = pitchers_info.sort_by { |_, era, _, _, _ | era }[0..2]
        @hold_info = pitchers_info.sort_by { |_, _, hold, _, _ | hold }.reverse[0..2]
        @save_info = pitchers_info.sort_by { |_, _, _, save, _ | save }.reverse[0..2]
        @win_info = pitchers_info.sort_by { |_, _, _, _, win | win }.reverse[0..2]
        @batting_rate_info = batters_info.sort_by { |_, rate, _, _, _ | rate }.reverse[0..2]
        @batting_number_info = batters_info.sort_by { |_, _, number, _, _| number }.reverse[0..2]
        @hit_info = batters_info.sort_by { |_, _, _, hit, _| hit }.reverse[0..2]
        @ops_info = batters_info.sort_by { |_, _, _, _, ops| ops }.reverse[0..2]
    end
    
    #成績ページのデータの再取得
    def reload
        #ページ全体のデータ取得
        pitcher_all_records = get_pitcher_all_records
        batter_all_records = get_batter_all_records
        
        #DBに成績データ格納
        save_pitchers_info(pitcher_all_records)
        save_batters_info(batter_all_records)
        
        redirect_to :index

    end
end
