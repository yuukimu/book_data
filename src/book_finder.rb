require "rubygems"
require "yaml"
require "jdbc/mysql"
class BookFinder
  def initialize
    config = YAML.load_file("database.yml")
    @user = config["development"]
  end

  # Prep the connection
  def connect
    Jdbc::MySQL.load_driver
    Java::com.mysql.jdbc.Driver
    @connSelect = java.sql.DriverManager.get_connection(@user["url"], @user["usermame"], @user["password"])
    @stmtSelect = @connSelect.create_statement
  end

  # Close off the connection
  def close
    @stmtSelect.close
    @connSelect.close
  end


  def book_list
    begin
      connect
      selectquery = %q{SELECT title, author FROM books}
      # Execute the query
      rsS = @stmtSelect.execute_query(selectquery)

      ary = []
      # For each row returned do some stuff
      while (rsS.next)
        ary << [rsS.getObject("title"), rsS.getObject("author")]
      end
      # puts ary.sort_by {|k| k[/\d+/].to_i}
    end
    close
    ary.sort!
  end

  def book_search(title, author)
    begin
      connect

      if title.empty? && !author.empty?
        selectquery = %Q{SELECT title, author FROM books WHERE author LIKE "%#{author}%"}
      elsif author.empty? && !title.empty?
        selectquery = %Q{SELECT title, author FROM books WHERE title LIKE "%#{title}%"}
      else
        selectquery = %Q{SELECT title, author FROM books 
          WHERE title LIKE "%#{title}%" OR author LIKE "%#{author}%"}
      end    

      rsS = @stmtSelect.execute_query(selectquery)

      ary = []
      while (rsS.next)
        ary << [rsS.getObject("title"), rsS.getObject("author")]
      end
    end
    close
    ary.sort!
  end

  def add_book(title, author)
    begin
      if title.empty? || author.empty?
        puts "データを入力してください" 
        return
      end

      connect()
      selectquery = %Q{INSERT INTO books (title, author) VALUES ("#{title}", "#{author}")}
      rsS = @stmtSelect.execute_update(selectquery)
      close()
    end
  end
end
