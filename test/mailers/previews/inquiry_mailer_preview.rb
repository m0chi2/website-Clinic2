# Preview all emails at http://localhost:3000/rails/mailers/inquiry_mailer
class InquiryMailerPreview < ActionMailer::Preview
  def inquiry
    inquiry = Inquiry.new(name: "犬猫 太郎", message: "お問い合わせメッセージ")

    InquiryMailer.received_email(inquiry)
    InquiryMailer.notice_email(inquiry)
  end
end
