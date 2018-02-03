module PlayersHelper

	#return the player's position by analyzing the position data in 2017, 
	def answer_usual_position(player_id)

	end

	#find fun's mention, tweet or news 
	def find_funs_activities(playe_id)

	end

	def find_all_palyers_song(player_id)
		url = "https://www.yakult-swallows.co.jp/pages/guide/players_song"
		charset = nil
		html = open(url) do |f|
			charset = f.charset
			f.read
		end
		Nokogiri::HTML.parse(html. nil, charset)

	end

end
