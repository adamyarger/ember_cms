class Api::V1::LeadsController < ApplicationController
	respond_to :json

	def index
		@leads = Lead.all
		render json: @leads 
	end

	def show
		@lead = Lead.find(params[:id])
		render json: @lead
	end

	def create
		@lead_create = Lead.create(lead_params)

		if @lead.save
			# @lead.reload
			render json: @lead, status: 201, location: [:api, :v1, @lead]
		else
			render json: { errors: @lead.errors }, status: 422
		end
	end

	def update
		@lead = Lead.find(params[:id])

		if @lead.update(lead_params)
			render json: @lead, status: 200, location: [:api, :v1, @lead]
		else
			render json: { errors: @lead.errors }, status: 422
		end
	end

	def destroy
		@lead = Lead.find(params[:id])
		@lead.destroy
		head 204
	end

	private

		def lead_params
			params.require(:lead).permit(:first_name, :last_name, :email, :phone, :status, :notes)
		end
end