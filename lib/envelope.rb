class DocuSignSignatory::Envelope
	require 'http'
	require 'model/envelope_status'
	attr_accessor :url

	def initialize
		self.url = "#{$_ds_CONFIG[:account_endpoint]}/envelopes"
	end

	# Gets the status of a single DocuSign envelope as an EnvelopeStatus
	#
	# See https://www.docusign.com.au/p/RESTAPIGuide/RESTAPIGuide.htm#REST%20API%20References/Get%20Envelope%20Status%20for%20One%20Envelope.htm%3FTocPath%3DREST%2520API%2520References%7C_____39
	#
	# @param [String] envelope_id The GUID of the envelope
	def get_status(envelope_id)
		response = DocuSignSignatory::HTTP.get("#{self.url}/#{envelope_id}")
		return DocuSignSignatory::Model::EnvelopeStatus.new(JSON.parse(response.body))
	end

	# Gets a list of all recipients of a single DocuSign envelope.
	#
	# See https://www.docusign.com.au/p/RESTAPIGuide/RESTAPIGuide.htm#REST%20API%20References/Get%20Envelope%20Status%20for%20One%20Envelope.htm%3FTocPath%3DREST%2520API%2520References%7C_____39
	#
	# @param [String] envelope_id The GUID of the envelope
	def get_recipients(envelope_id)
		response = DocuSignSignatory::HTTP.get("#{self.url}/#{envelope_id}/recipients")
		return JSON.parse(response.body)
	end
end