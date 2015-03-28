# encoding : utf-8
class MemowordsController < ApplicationController
    skip_before_filter :admin, except: ['index','new','show','edit','create','destroy']
  # GET /memowords
  # GET /memowords.json
  def book_show
    #book_initを初回だけに出来る方法は無いものか
    book_init(params[:num].to_i)
    @cards = @memoword.cards.page(params[:page]).per(10)
  end
  def book1
    book_number = 1
    book_init(book_number)
  end
  def book2
    book_number = 2
    book_init(book_number)
  end
  def book3
    book_number = 3
    book_init(book_number)
  end
  def book_edit
    @memoword = Memoword.find(session[:memoword_id])
  end
  def index
    @memowords = Memoword.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @memowords }
    end
  end

  # GET /memowords/1
  # GET /memowords/1.json
  def show
    @memoword = Memoword.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @memoword }
    end
  end

  # GET /memowords/new
  # GET /memowords/new.json
  def new
    @memoword = Memoword.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @memoword }
    end
  end

  # GET /memowords/1/edit
  def edit
    @memoword = Memoword.find(session[:memoword_id])
  end

  # POST /memowords
  # POST /memowords.json
  def create
    @memoword = Memoword.new(params[:memoword])

    respond_to do |format|
      if @memoword.save
        format.html { redirect_to @memoword, notice: 'Memoword was successfully created.' }
        format.json { render json: @memoword, status: :created, location: @memoword }
      else
        format.html { render action: "new" }
        format.json { render json: @memoword.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /memowords/1
  # PUT /memowords/1.json
  def update
    @memoword = Memoword.find(params[:id])

    respond_to do |format|
      if @memoword.update_attributes(params[:memoword])
        redirect_book = "book" + @memoword.number.to_s
        #format.html { redirect_to @memoword, notice: 'Memoword was successfully updated.' }
        format.html { redirect_to :action => redirect_book, notice: 'Memoword was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @memoword.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /memowords/1
  # DELETE /memowords/1.json
  def destroy
    @memoword = Memoword.find(params[:id])
    @memoword.destroy

    respond_to do |format|
      format.html { redirect_to memowords_url }
      format.json { head :no_content }
    end
  end
  
  private
  def book_init(book_number)
    @memoword = Memoword.find_by_number_and_user_id(book_number,session[:user_id])
    
    unless @memoword
      @memoword = Memoword.new
      @memoword.number = book_number
      @memoword.division = "分類を入力してください"
      @memoword.title = "bookのタイトルを自分で決めることが出来ます"
      @memoword.comment = "横の編集ボタンを押せば、分類、タイトル、本の簡単な説明を入力変更できます"
      @memoword.user_id = session[:user_id]
      
      this_book = 'book' + book_number.to_s
    
      respond_to do |format|
        if @memoword.save
          format.html { render :action => this_book, notice: '初期化に成功しました' }
          format.json { render json: @memoword, status: :created, location: @memoword }
        else
          #format.html { render action: "new" }
          format.html { redirect_to root_url, notice: '初期化に失敗しました　暫くしてからアクセスしてください' }
          format.json { render json: @memoword.errors, status: :unprocessable_entity }
        end
      end
    end
    session[:memoword_id] = @memoword.id
    @list = @memoword.listing_cards.order('created_at DESC').limit(5)
  end
  
end
