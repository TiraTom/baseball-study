class PlayersController < ApplicationController
    include PlayersHelper

	def index
		@all_players = Player.all
	end

	def show
		@player = Player.find(params[:id])
		@position = answer_usual_position(@player.id)
		@funs_activities = find_funs_activities(@player.id)
	end

	def edit
		#パスワード式にしてみたい
	end

end
