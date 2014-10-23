class CardsController < ApplicationController

	before_action :set_card, only: [:update, :destroy]

	def create
		@card = Card.create(title: "new card", body: "write something here ...", project_id: params[:project_id])
		redirect_to :back, notice: "New card added"
	end

	def update
	end

	def destroy
		@card.destroy

		respond_to do |format|
			format.html {redirect_to :back, notice: "Card deleted"}
			format.js
		end
	end

	private

	def set_card
		@card = Card.find(params[:id])
	end
end
