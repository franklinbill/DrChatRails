module SessionsHelper

  def log_in(user)
    session[:user_id] = user.id
  end

  def logged_in?
    !current_user.nil?
  end

  # 点击log_out,安全退出.只关闭浏览器时会保存cookie,安全退出后就没有了
  def log_out
    forget_user(current_user)
    session.delete(:user_id)
  end

  # Returns the user corresponding to the remember token cookie.
  def current_user
    if session[:user_id]
      @current_user||= User.find_by(id: session[:user_id])
    elsif cookies.signed[:user_id]
      user = User.find_by(id: cookies.signed[:user_id])
      if user && user.user_authenticated?(:remember, cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

  def remember_user(user)
    user.user_remember
    # Because it places the id as plain text, this method exposes the form of the application’s cookies
    # and makes it easier for an attacker to compromise user accounts. To avoid this problem,
    # we’ll use a signed cookie, which securely encrypts the cookie before placing it on the browser:
    cookies.signed[:user_id] = {value: user.id, expires: 5.minutes.from_now.utc}
    cookies[:remember_token] = {value: user.remember_token, expires: 5.minutes.from_now.utc}
  end

  def forget_user(user)
    user.user_forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  def current_user?(user)
    user == current_user
  end

  def read_flag_count(chat_id)
    @read_flag_count=ReadFlag.joins(:message).where(user_id:current_user.id, flag:false, messages: {chat_id: chat_id}).count
  end

  def read_or_not(chat_id, current_user_id, message_user_id, message_id)
    chat=Chat.find_by_id(chat_id)
    users=chat.users

    if users.size>2
      return false
    end

    reciver_id=current_user_id
    for user in users
      if user.id!=message_user_id
        reciver_id=user.id
        break;
      end
    end

    if current_user_id!=reciver_id
      read_flags=ReadFlag.where(user_id:reciver_id, message_id: message_id)
      read_flag=read_flags.first
      if read_flag.nil?
        return false
      else
        return read_flag[:flag]
      end
    end

    return false
  end

  def chatroom_user_num(chat_id)
    if chat_id < 1
      return 0;
    else
      chat=Chat.find_by_id(chat_id)
      return chat.users.size
    end
  end
end
