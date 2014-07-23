# Provides methods for interacting with the DocuSign REST API
# login_information endpoint. See more info at:
#
# https://www.docusign.com.au/p/RESTAPIGuide/RESTAPIGuide.htm#REST%20API%20References/Login.htm?Highlight=login_information
class DocuSignSignatory::Login
	require 'http'
	attr_accessor :url

	# Set up the url for the route based on the config endpoint
	def initialize
		self.url = "#{$_ds_CONFIG[:endpoint]}/login_information"
	end

	# Call the login_information endpoint, passing in different
	# authentication headers depending on whether the user is using
	# OAUTH or DocuSign authentication.
	#
	# @note `:verify => false` is specified for HTTPParty HTTPS requests to fix an OpenSSL issue
	def login_information
		response = DocuSignSignatory::HTTP.get(self.url)
		information = JSON.parse(response.body)
		return information
	end
end