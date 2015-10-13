class LessonsController < ApplicationController
  def index
    @lessons = Lesson.all
    render :index
  end

  def show
    @lesson = Lesson.find(params[:id])
    render :show
  end

  def destroy
    @lesson = Lesson.find(params[:id])
    @lesson.destroy
    redirect_to lessons_path
  end

  def new
    @lesson = Lesson.new
    render :new
  end

  def create
    @lesson = Lesson.new(lesson_params)
    if @lesson.save
      flash[:notice] = "You did it!! Lesson added."
      redirect_to lessons_path
    else
      render :new
    end
  end

  def edit
    @lesson = Lesson.find(params[:id])
    render :edit
  end

  def update
    @lesson = Lesson.find(params[:id])
    if @lesson.update(lesson_params)
      redirect_to lesson_path
    else
      render :edit
    end
  end

  private
  def lesson_params
    params.require(:lesson).permit(:name, :description, :number)
  end
end
