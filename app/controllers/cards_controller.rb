class CardsController < ApplicationController

	before_action :set_card, only: [:update, :destroy]

	def create
		@card = Card.create(title: "new card", body: "write something here ...", project_id: params[:project_id])
		
		respond_to do |format|
			format.html { redirect_to :back, notice: "New card added"}
			format.js
		end
	end

	def update
		if @card.update(params.require(:card).permit(:title, :body))
	  		respond_to do |format|
			      format.html { redirect_to(@project, :notice => 'Project was successfully updated.') }
			      format.json { respond_with_bip(@card) }
			  end
		else
			respond_to do|format|
			    format.html { redirect_to(@project , notice: "Something went wrong") }
			    format.json { respond_with_bip(@card) }
			end
	    end
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
