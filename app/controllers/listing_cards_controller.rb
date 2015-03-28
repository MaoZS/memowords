class ListingCardsController < ApplicationController
  # GET /listing_cards
  # GET /listing_cards.json
  def index
    @listing_cards = ListingCard.all
    #@listing_cards = ListingCard.where(:memoword_id => session[:memoword_id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @listing_cards }
    end
  end

  # GET /listing_cards/1
  # GET /listing_cards/1.json
  def show
    @listing_card = ListingCard.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @listing_card }
    end
  end

  # GET /listing_cards/new
  # GET /listing_cards/new.json
  def new
    @listing_card = ListingCard.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @listing_card }
    end
  end

  # GET /listing_cards/1/edit
  def edit
    @listing_card = ListingCard.find(params[:id])
  end

  # POST /listing_cards
  # POST /listing_cards.json
  def create
    @listing_card = ListingCard.new(params[:listing_card])

    respond_to do |format|
      if @listing_card.save
        format.html { redirect_to @listing_card, notice: 'Listing card was successfully created.' }
        format.json { render json: @listing_card, status: :created, location: @listing_card }
      else
        format.html { render action: "new" }
        format.json { render json: @listing_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /listing_cards/1
  # PUT /listing_cards/1.json
  def update
    @listing_card = ListingCard.find(params[:id])

    respond_to do |format|
      if @listing_card.update_attributes(params[:listing_card])
        format.html { redirect_to @listing_card, notice: 'Listing card was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @listing_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listing_cards/1
  # DELETE /listing_cards/1.json
  def destroy
    @listing_card = ListingCard.find(params[:id])
    @listing_card.destroy

    respond_to do |format|
      format.html { redirect_to listing_cards_url }
      format.json { head :no_content }
    end
  end
end
