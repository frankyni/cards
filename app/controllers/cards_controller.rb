class CardsController < ApplicationController

	def create
		@card = Card.create(title: "new card", body: "write something here ...", project_id: params[:project_id])
		redirect_to :back, notice: "New card added"
	end

	def update
	end

	def destroy
	end
end
