class PeopleController < ApplicationController
  def new
    @person = Person.new
  end

  def create
    @person = Person.new(person_params)

    if @person.save
      redirect_to @person
    else
      flash.now[:errors] = @person.errors.full_messages
      render :new
    end
  end

  def show
    @person = Person.find(params[:id])
  end

  def index
    @people = Person.all
  end

  private

  def person_params
    params.require(:person).permit(
      :first_name,
      :last_name,
      :middle_name,
      :company,
      :domain
    )
  end
end
