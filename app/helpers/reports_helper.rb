# frozen_string_literal: true

module ReportsHelper
  # returns 0-1 range of spam likilihood
  def analyze_spam_likilihood; end

  # takes message to send and report id to send a message to the reporter (with reply address of the true sender)
  def mail_user; end

  # takes username and password, checking against established login credentials
  # use bcrypt?
  def authenticate_user; end

  
end
