# Preview all emails at http://localhost:3000/rails/mailers/parent_mailer
class ParentMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/parent_mailer/visit_happened
  def visit_happened
    ParentMailer.visit_happened
  end

  # Preview this email at http://localhost:3000/rails/mailers/parent_mailer/welcome
  def welcome
    ParentMailer.welcome
  end

  # Preview this email at http://localhost:3000/rails/mailers/parent_mailer/getting_started
  def getting_started
    ParentMailer.getting_started
  end

end
