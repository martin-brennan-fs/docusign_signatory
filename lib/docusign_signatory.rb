# This class provides interfaces for setting up
# the DocuSign account settings as well as API
# endpoint.
#
# Before making any calls to the DocuSign API,
# you should set up the config:
#
# ```
# #using DocuSign Auth
# DocuSignSignatory.config("<username>", "<password>", "<account_id>", "<integrator_key>")
#
# #using OAuth
# DocuSignSignatory.config("<token>")
# ```
class DocuSignSignatory
	$_ds_CONFIG = {
		:username => nil,
		:password => nil,
		:account_id => nil,
		:integrator_key => nil,
		:endpoint_server => nil,
		:api_version => nil,
		:endpoint => nil,
		:account_endpoint => nil,
		:access_token => nil,
		:use_oauth2 => false,
		:i => nil
	}

	# Sets up configuration required for communication with the DocuSign
	# REST api, including account information and endpoint details, using a username, password, account_id
	# and integrator key.
	#
	# DocuSign account details can be found under Preferences > API
	#
	# @param [String] username Your DocuSign account username (GUID or email)
	# @param [String] password Your DocuSign API password
	# @param [String] account_id Your DocuSign account ID
	# @param [String] integrator_key Your DocuSign integrator/API key
	# @param [String] endpoint_server
	#   The endpoint server to connect tofor the API calls. Can be `www` or `eu1`
	# @param [String] api_version The DocuSign API version to use (v1, v2)
	def self.config(username,
					password,
					account_id, 
					integrator_key,
					endpoint_server = "www",
					api_version = "v2")
		$_ds_CONFIG[:username] = username
		$_ds_CONFIG[:password] = password
		$_ds_CONFIG[:account_id] = account_id
		$_ds_CONFIG[:integrator_key] = integrator_key
		$_ds_CONFIG[:endpoint_server] = endpoint_server
		$_ds_CONFIG[:api_version] = api_version
		$_ds_CONFIG[:endpoint] = "https://#{endpoint_server}.docusign.net/restapi/#{api_version}"
		$_ds_CONFIG[:account_endpoint] = "https://#{endpoint_server}.docusign.net/restapi/#{api_version}/accounts/#{account_id}"

		return $_ds_CONFIG
	end

	# Sets up configuration required for communication with the DocuSign
	# REST api, including account information and endpoint details, using an OAUTH2 token.
	#
	# Also, the DocuSign REST API login_information endpoint is called
	# to get the account endpoint for future API requests.
	#
	# @param [String] access_token A valid DocuSign OAUTH2 access token
	# @param [String] endpoint_server
	#   The endpoint server to connect tofor the API calls. Can be `www` or `eu1`
	# @param [String] api_version The DocuSign API version to use (v1, v2)
	def self.config_oauth(access_token,
					endpoint_server = "www",
					api_version = "v2")
		$_ds_CONFIG[:use_oauth2] = true
		$_ds_CONFIG[:access_token] = access_token
		$_ds_CONFIG[:endpoint_server] = endpoint_server
		$_ds_CONFIG[:api_version] = api_version
		$_ds_CONFIG[:endpoint] = "https://#{endpoint_server}.docusign.net/restapi/#{api_version}"

		# Set up the account endpoint using login at the same time.
		# The account endpoint is used for all future API requests.
		if ($_ds_CONFIG[:account_endpoint].nil?)

			# Get the login information from the DS API
			login = DocuSignSignatory::Login.new
			account = login.login_information
			$_ds_CONFIG[:account_endpoint] = account["loginAccounts"][0]["baseUrl"]
		end

		return $_ds_CONFIG
	end
end

require 'login'
require 'envelope'