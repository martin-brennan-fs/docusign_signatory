class DocuSignSignatory::HTTP
	require 'httparty'

	def self.get(url)

		# Check if using oauth first, if so
		# run the GET request with an Authorization
		# header with the auth token.
		if ($_ds_CONFIG[:use_oauth2])
			response = HTTParty.get(url,
						:headers => {
							"Authorization" => "bearer #{$_ds_CONFIG[:access_token]}",
							"Accept" => "application/json",
							"Content-Type" => "application/json"
						}, :verify => false)
		else

			# Otherwise run the GET with a X-DocuSign-Authentication
			# header using username, password and integrator key.
			auth_header = <<-eos
							<DocuSignCredentials>
								<Username>$_ds_CONFIG[:username]</Username>
								<Password>$_ds_CONFIG[:password]</Password>
								<IntegratorKey>$_ds_CONFIG[:integrator_key]</IntegratorKey>
							</DocuSignCredentials>
						  eos
			response = HTTParty.get(url,
						:headers => {
							"X-DocuSign-Authentication" => auth_header,
							"Accept" => "application/json",
							"Content-Type" => "application/json"
						}, :verify => false)
		end

		return response
	end
end