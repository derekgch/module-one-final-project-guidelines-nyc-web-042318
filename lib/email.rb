# require 'mail'
#
# options = { :address              => "smtp.gmail.com",
#             :port                 => 465,
#             :domain               => 'your.host.name',
#             :user_name            => 'cocktail4one@gmail.com',
#             :password             => '****',
#             :authentication       => :login,
#             :ssl                  => true,
#             :openssl_verify_mode  => 'none'
#           }
#
#
#
# Mail.defaults do
#   delivery_method :smtp, options
# end
#
#
# def mail_that(recipient = 'test@test.com',subjects="test",body_message="test")
#   Mail.deliver do
#          to recipient
#        from 'test@test.com'
#     subject subjects
#        body body_message
#   end
# end
#
# # mail_that(recipient,subjects,body_message)
