class EmailsController < ApplicationController

  def index
    @emails = Email.all
  end

  def create
    @email = Email.create(
      object:Faker::Book.title,
      body: Faker::Lorem.paragraph,
    )
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
  end

  def show
    @email = Email.find(params[:id])
    @email.update(read: true)
    @email.save
    respond_to do |format|
      format.html { redirect_to email_path(@email) }
      format.js { }
    end
  end

  def destroy
    @email = Email.find(params[:id])
    @emails = Email.all
    @email.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
  end

  def update
    @email = Email.find(params[:id])
    if @email.read == true
      @email.update(read: false)
      @email.save
    else
      @email.update(read: true)
      @email.save
    end
    respond_to do |format|
      format.html {redirect_to emails_path}
      format.js {}
    end
  end

end
