class UserMailer < ActionMailer::Base
  default from: "Lead_Knittah@Knittaz_4_Life.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.signup_confirmation.subject
  #
  def signup_confirmation(user)
    @user = user
    @greeting = "Thanks for signing up, #{@user.name}!"

    # mail to: user.email, subject: "Congratulations on becoming a Knittah 4 Life, #{@user.name}!"
  end

  def tag_confirmation(user, tagger)
    @user = user
    @greeting = "#{user.name} - You have been stitched by #{tagger.name}!!! MUHUHAHAHAHAHAHAHAHAHAHAHA!!!! >;P"

    # mail to: user.email, subject: "You have been stitched!"
  end

  def new_follower_notice(user, follower)
    @greeting = "Pleasant greetings, #{user.name}! Just thought you'd like to know that #{follower.name} is now following your yarn! You now have #{user.followers.count} followers!"

    # mail to: user.email, subject: "Congrats on your new follower!!!"
  end
end
