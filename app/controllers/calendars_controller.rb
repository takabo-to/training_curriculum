class CalendarsController < ApplicationController

  # １週間のカレンダーと予定が表示されるページ
  def index
    getWeek
    @plan = Plan.new
  end

  # 予定の保存
  def create
    Plan.create(plan_params)
    redirect_to action: :index
  end

  private

  def plan_params
    params.require(:calendars).permit(:date, :plan)
  end

<<<<<<< HEAD
  def getWeek
=======
  def get_week
>>>>>>> parent of ac9e9d3 (Merge pull request #8 from takabo-to/second_training)
    wdays = ['(日)','(月)','(火)','(水)','(木)','(金)','(土)']

    # Dateオブジェクトは、日付を保持しています。下記のように`.today.day`とすると、今日の日付を取得できます。
    @todays_date = Date.today
    # 例)　今日が2月1日の場合・・・ Date.today.day => 1日

    @week_days = []

    plans = Plan.where(date: @todays_date..@todays_date + 6)

    7.times do |x|
      today_plans = []
      plans.each do |plan|
        today_plans.push(plan.plan) if plan.date == @todays_date + x
      end
<<<<<<< HEAD
      days = { :month => (@todays_date + x).month, :date => (@todays_date+x).day, :plans => today_plans}
=======
      days = { month: (@todays_date + x).month, date: (@todays_date+x).day, plans: today_plans}
>>>>>>> parent of ac9e9d3 (Merge pull request #8 from takabo-to/second_training)
      @week_days.push(days)
    end

  end
end
