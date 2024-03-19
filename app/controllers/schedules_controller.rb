class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]

  def index
    @schedules = Schedule.all
    @total_schedules = Schedule.count
    @today_date = Time.now.in_time_zone("Tokyo").to_date
  end

  def show
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      flash[:success] = "スケジュールを登録しました"
      redirect_to schedules_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @schedule.update(schedule_params)
      flash[:success] = "スケジュールを更新しました"
      redirect_to schedule_path(@schedule)
    else
      render 'edit'
    end
  end

  def destroy
    @schedule.destroy
    flash[:success] = "スケジュールを削除しました"
    redirect_to schedules_path
  end

  private

  def set_schedule
    @schedule = Schedule.find(params[:id])
  end

  def schedule_params
    params.require(:schedule).permit(:title, :start_date, :end_date, :all_day, :schedule_memo)
  end
end
