class PostMailer < ApplicationMailer
  def create_mail(task)
    @task = task
    mail(
      subject: "投稿内容お知らせ"
      to: "toe@test.com"
      from: "from@test.com"
    )
  end
end
