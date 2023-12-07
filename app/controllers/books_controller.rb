class BooksController < ApplicationController
  def index
    @books = Book.all
  end
  
  def new
    @book = Book.new  
  end
  
  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book.id)
    else
      render :new
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
    if @book.update(book_params)
    redirect_to book_path(@book) # 正しいリダイレクト先
    else
    render :edit
    end
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    redirect_to '/books'
    else
    render :edit
    end
  end
  
  def destroy
    @book = Book.find(params[:id])  # データ（レコード）を1件取得
    @book.destroy  # データ（レコード）を削除
    redirect_to '/books'  # 投稿一覧画面へリダイレクト  
  end
  
  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
