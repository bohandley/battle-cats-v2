class ErrorsController < ApplicationController

	def no_access
		render 'no_access'
	end
	
	def not_found
	render(:status => 404)
	end

	def internal_server_error
	render(:status => 500)
	end

end