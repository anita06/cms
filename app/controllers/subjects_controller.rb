class SubjectsController < ApplicationController

  layout "admin"
  before_action :confirmed_logged_in

  def index
    @subjects = Subject.sorted
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new({:name => "Default"})
  end

  def create
    # Instantiate a new object using form parameters as below
    # subject = Subject.new(params.require(:subject). permit(:name, :position, :visible))
    # OR
    # Other way is - define the method as private and then pass it as below
    @subject = Subject.new(subject_params)
    # Save the object
    if @subject.save
      # If save succeeds, redirect to the index action
      flash[:notice] = "Subject Created Successfully"
      redirect_to(:action => 'index')
    else
      # If save fails, redisplay the form so user can fix problems
      render('new')
    end
  end

  def edit
    @subject = Subject.find(params[:id])
  end

  def update
    # Find an existing object using form parameters as below
    @subject = Subject.find(params[:id])
    # Update the object
    if @subject.update_attributes(subject_params)
      # If update succeeds, redirect to the index action
      flash[:notice] = "Subject Updated Successfully"
      redirect_to(:action => 'show', :id => @subject.id)
    else
      # If update fails, redisplay the form so user can fix problems
      render('edit')
    end
  end

  def delete
      @subject = Subject.find(params[:id])
  end

  def destroy
      subject = Subject.find(params[:id])
      subject.destroy
      flash[:notice] = "Subject '#{subject.name}' Destroyed Successfully"
      redirect_to(:action => 'index' )
  end

  private

  def subject_params
    # same as using "params[:subject]", except that it:
    #  - raises an error if :subject is not present
    #  - allows listed attributes to be mass-assigned
    params.require(:subject). permit(:name, :position, :visible)
  end

end
