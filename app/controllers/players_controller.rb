class PlayersController < ApplicationController
	#I'm not sure the way to connect a helper to a controller
	include :players_helper

	def index
		@all_players = Player.all
	end

	def show
		@player = Player.find(params[:id])
		@position = answer_usual_position(@player.id)
		@funs_activities = find_funs_activities(@player.id)
	end

	def edit
		#only the user who has the correct password can edit the information of the player

	end

end
