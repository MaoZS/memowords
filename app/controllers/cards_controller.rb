# encoding : utf-8
class CardsController < ApplicationController
    skip_before_filter :admin, only: ['create','new','testfile']
  # GET /cards
  # GET /cards.json
  def index
    @cards = Card.page(params[:page]).per(7)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cards }
    end
  end

  # GET /cards/1
  # GET /cards/1.json
  def show
    @card = Card.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @card }
    end
  end

  # GET /cards/new
  # GET /cards/new.json
  def new
    @card = Card.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @card }
    end
  end

  # GET /cards/1/edit
  def edit
    @card = Card.find(params[:id])
  end

  # POST /cards
  # POST /cards.json
  def create
    @card = Card.new(params[:card])
    @card.user_id = session[:user_id]

    respond_to do |format|
      if @card.save
        listingcard = ListingCard.new do |m|
          m.memoword_id = session[:memoword_id]
          m.card_id = @card.id
          m.memorized = false
        end
        listingcard.save
        #format.html {render action: "new" }
        format.html { redirect_to new_card_url, notice: 'カードは作成されBookに登録されました' }
        format.json { render json: @card, status: :created, location: @card }
      else
        format.html { render action: "new" }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cards/1
  # PUT /cards/1.json
  def update
    @card = Card.find(params[:id])

    respond_to do |format|
      if @card.update_attributes(params[:card])
        format.html { redirect_to @card, notice: 'Card was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cards/1
  # DELETE /cards/1.json
  def destroy
    @card = Card.find(params[:id])
    @card.destroy

    respond_to do |format|
      format.html { redirect_to cards_url }
      format.json { head :no_content }
    end
  end
  def testfile
    if session[:memoword_id]
      (1..100).each do |num|
      
        card = Card.new do |c|
          c.question = "質問#{num}"
          c.answer = "答え#{num}"
          c.division = "英語"
          c.user_id = session[:user_id]
        end
        card.save
        listingcard = ListingCard.new do |lc|
          lc.card_id = card.id
          lc.memoword_id = session[:memoword_id]
          lc.memorized = false
        end
        listingcard.save
      end
    end
    respond_to do |format|
      format.html { redirect_to book1_url }
      format.json { head :no_content }
    end    
  end
end
