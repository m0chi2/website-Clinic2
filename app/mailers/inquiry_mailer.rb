class InquiryMailer < ApplicationMailer
	default from: "hoge@gmail.com"

	def received_email(inquiry)
		@inquiry = inquiry
		mail(:to => inquiry.email,
			 :subject => 'お問い合わせ受付のお知らせ'
		) do |format|
			format.text
		end
	end

	def notice_email(inquiry)
		@inquiry = inquiry
		mail(:to => ENV["EMAIL_ADDRESS"],
			 :subject => 'お問い合わせ通知'
		) do |format|
			format.html
		end
	end
end
