class LinksController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy]

  def index
    @links = Link.order('created_at DESC').page(params[:page]).per(12)
  end

  class VolunteerOption
    def initialize(name,url)
      @name = name
      @url = url
    end

    attr_accessor :name, :url
  end

  def show
    @link = Link.find(params[:id])
    @tags = @link.tags.gsub(' ', '+').gsub(',', '')

    # @volunteer_options = VolunteerMatch.new.get_charity(@tags)
    @volunteer_option1 = [ VolunteerOption.new("Boys & Girls Club","http://www.bgca.org/whoweare/Pages/FindaClub.aspx") ]
    @volunteer_option2 = [ VolunteerOption.new("Red Cross Volunteer","http://www.redcross.org/support/volunteer") ]

    @url = "http://api.charitynavigator.org/api/v1/search/?app_key=#{ENV['CHARITY_NAVIGATOR_KEY']}&app_id=#{ENV['CHARITY_NAVIGATOR_APP_ID']}&format=json&term=#{@tags}"
  end

  def root
    @link = Link.last
  end

  def new
    @link = Link.new
  end

  def edit
  end

  def create
    @link = Link.new(link_params)

    respond_to do |format|
      if @link.save
        format.html { redirect_to @link, notice: 'Link was successfully created.' }
        format.json { render action: 'show', status: :created, location: @link }
      else
        format.html { render action: 'new' }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @link.update(link_params)
        format.html { redirect_to @link, notice: 'Link was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @link.destroy
    respond_to do |format|
      format.html { redirect_to links_url }
      format.json { head :no_content }
    end
  end

  private
    def set_link
      @link = Link.find(params[:id])
    end

    def link_params
      params.require(:link).permit(:content, :tags, :description, :title)
    end
end
