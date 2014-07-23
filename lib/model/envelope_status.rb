class DocuSignSignatory::Model

	class EnvelopeStatus
		attr_accessor :allow_reassign,
					  :certificate_url,
					  :created_datetime,
					  :custom_fields_uri,
					  :documents_combined_uri,
					  :documents_uri,
					  :email_blurb,
					  :email_subject,
					  :email_wetsign,
					  :envelope_id,
					  :envelope_uri,
					  :notification_uri,
					  :recipients_uri,
					  :status,
					  :status_changed_datetime,
					  :templates_uri,
					  :json

		def initialize(json)
			self.allow_reassign = json["allowReassign"]
			self.certificate_url = json["certificateUri"]
			self.created_datetime = json["createdDateTime"]
			self.custom_fields_uri = json["customFieldsUri"]
			self.documents_combined_uri = json["documentsCombinedUri"]
			self.documents_uri = json["documentsUri"]
			self.email_blurb = json["emailBlurb"]
			self.email_subject = json["emailSubject"]
			self.email_wetsign = json["emailWetSign"]
			self.envelope_id = json["envelopeId"]
			self.envelope_uri = json["envelopeUri"]
			self.notification_uri = json["notificationUri"]
			self.recipients_uri = json["recipientsUri"]
			self.status = json["status"]
			self.status_changed_datetime = json["statusChangedDateTime"]
			self.templates_uri = json["templatesUri"]
			self.json = json
		end
	end
end