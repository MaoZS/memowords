 # encoding : utf-8
class User < ActiveRecord::Base
  attr_accessible :email, :log_in_name, :name,:suspend,:password,:password_confirmation
  attr_accessor :password
  before_save :encrypt_password
  
  has_many :cards
  
    validates :password,
   :presence => {:message => 'パスワードを入力してください'},:on => :create,
   :length   => {:minimum => 8, :message => 'パスワードは8桁以上入力してください'},
   :format   => {:with => /^\w+$/, :message => '半角英数字のみで入力してください'},
   :confirmation => {:message => '２回入力したパスワードが一致しません、パスワードを正しく入力してください'}
  
  validates :email,
   :presence => {:message => 'メールアドレスが入力されていません'},
   :uniqueness => {:message => 'すでに登録されているメールアドレスです。違うメールアドレスを入力してください'}
   
  validates :log_in_name,
   :presence => {:message => 'ログインネームが入力されていません'},
   :format   => {:with => /^\w+$/, :message => '半角英数字のみで入力してください'},
   :uniqueness => {:message => 'そのログインネームはすでに使われています。違うログインネームを入力してください'}
   
  validates :name,
   :presence => {:message => '名前が入力されていません'},
   :format   => {:with => /^\w+$/, :message => '半角英数字のみで入力してください'},
   :uniqueness => {:message => 'すでに使われている名前です。違う名前を入力してください'}
   
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password,password_salt)
    end
  end
  
  def self.authenticate(log_in_name,password)
    user = find_by_log_in_name(log_in_name)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password,user.password_salt)
      user
    else
      nil
    end
  end
  
  def self.check_password(user_id,password)
    user = find(user_id)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password,user.password_salt)
      true
    else
      nil
    end
  end
  
end
