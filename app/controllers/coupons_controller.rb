class CouponsController < ApplicationController
  # GET /coupons
  # GET /coupons.xml
  before_filter :authenticate, :except => [:index, :show]

  def index
    @coupon = Coupon.search(params[:search_query])
    #@coupon.category_id.(params[:category_id])
    if params[:category_id]
      category =  Category.find(params[:category_id])
      @coupon = category.coupons
    else
      @coupons = Coupon.all
    end
    #@categories = Category.all


    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @coupon }
    end
  end

  # GET /coupons/1
  # GET /coupons/1.xml
  def show
    @coupon = Coupon.find(params[:id])


    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @coupon }
    end
  end

  # GET /coupons/new
  # GET /coupons/new.xml
  def new
    @coupon = Coupon.new
    @categories = Category.all

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @coupon }
    end
  end

  # GET /coupons/1/edit
  def edit
    @coupon = Coupon.find(params[:id])
    @categories = Category.all
  end

  # POST /coupons
  # POST /coupons.xml
  def create
    return unless current_user.admin or current_client
    @coupon = current_user.coupons.new(params[:coupon])

    respond_to do |format|
      if @coupon.save
        format.html { redirect_to(@coupon, :notice => 'coupon was successfully created.') }
        format.xml  { render :xml => @coupon, :status => :created, :location => @coupon }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @coupon.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /coupons/1
  # PUT /coupons/1.xml
  def update
    return unless current_user.admin
    @coupon = Coupon.find(params[:id])

    respond_to do |format|
      if @coupon.update_attributes(params[:coupon])
        @coupon.Brand_name = params[:Brand_name]
        @coupon.Offer_desc = params[:Offer_desc]
        @coupon.Saving_amount = params[:Saving_amount]
        #@categories = Category.all
        @coupon.category_id = params[:category_id]
        @coupon.Start_date = params[:Start_date]
        @coupon.Expiry_date = params[:Expiry_date]
        @coupon.Client_details = params[:Client_details]
        @coupon.Barcode_no = params[:Barcode_no]
        @coupon.update_attributes(params[:coupon])

        format.html { redirect_to(@coupon, :notice => 'Coupon was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @coupon.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /coupons/1
  # DELETE /coupons/1.xml
  def destroy
    @coupon = Coupon.find(params[:id])
    @coupon.destroy

    flash[:success] = "User deleted."

    respond_to do |format|
      format.html { redirect_to(coupons_url) }
      format.xml  { head :ok }
    end
  end

  #def display
  #  @ids = []
   # params[:display].each do |key, val|
    #  if val != "0"
     #   @ids << key
      #end
    #end
    #render 'display'
  #end

  def show_multiple

    @coupon = Coupon.find(params[:coupon_ids])
  end



end

