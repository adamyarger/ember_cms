class Api::V1::LeadsController < ApplicationController
	

	def index
		@leads = Lead.all
		render json: @leads 
	end

	def show
		render json: lead
	end

	def create
		@lead_create = Lead.create(lead_params)
		# respond_with :api, :v1, Lead.create(lead_params)
		render json: @lead
	end

	def update
		@lead_update = lead.update(lead_params)
		render json: @lead
	end

	def destroy
		respond_with lead.destroy
	end

	private

		def lead
			Lead.find(params[:id])
		end

		def lead_params
			params.require(:lead).permit(:first_name, :last_name, :email, :phone, :status, :notes)
		end
end