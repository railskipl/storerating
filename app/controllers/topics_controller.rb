class TopicsController < ApplicationController
  before_filter :set_forums

  # GET /topics
  # GET /topics.json
  def index
    @topics = @forum.topics

    respond_to do |format|
      format.html # index.html.erb
      format.json  { render json: @topics }
    end
  end

  # GET /topics/1
  # GET /topics/1.json
  def show
    @forum = Forum.find(params[:forum_id])
    @topic = Topic.find(params[:id])


    respond_to do |format|
      format.html # show.html.erb
      format.json  { render json: @topic }
    end
  end

  # GET /topics/new
  # GET /topics/new.json
  def new
    #@topic = Topic.new
    @topic = @forum.topics.new

    respond_to do |format|
      format.html # new.html.erb
      format.json  { render json: @topic }
    end
  end

  # GET /topics/1/edit
  def edit
    @topic = Topic.find(params[:id])
  end

  # POST /topics
  # POST /topics.json
  def create
    @topic = @forum.topics.new(params[:topic])
    #@topic = Topic.new(params[:topic])

    respond_to do |format|
      if @topic.save
        format.html { redirect_to(forum_topics_path(@forum), :notice => 'Topic was successfully created.') }
        format.json  { render json: @topic, :status => :created, :location => @topic }
      else
        format.html { render :action => "new" }
        format.json  { render json: @topic.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /topics/1
  # PUT /topics/1.json
  def update
    @topic = Topic.find(params[:id])

    respond_to do |format|
      if @topic.update_attributes(params[:topic])
        format.html { redirect_to(forum_topic_path(@forum, @topic), :notice => 'Topic was successfully updated.') }
        format.json  { head :ok }
      else
        format.html { render :action => "edit" }
        format.json  { render json: @topic.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /topics/1
  # DELETE /topics/1.json
  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy

    respond_to do |format|
      format.html { redirect_to(topics_url) }
      format.json  { head :ok }
    end
  end

  private

  def set_forums
    @forum = Forum.find(params[:forum_id])
  end

end
