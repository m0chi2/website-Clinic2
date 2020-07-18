class InquiryMailer < ApplicationMailer
	default from: "hoge@example.com"

	def received_email(inquiry)
		@inquiry = inquirymail(:to => inquiry.email, :subject => 'お問い合わせを承りました')
	end
end
