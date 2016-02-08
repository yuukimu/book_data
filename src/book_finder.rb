class BookFinder
  def book_list
    # Load all required gems
    require "rubygems"
    require "yaml"
    require "jdbc/mysql"
    require "java"

    begin
      # Prep the connection
      Jdbc::MySQL.load_driver
      Java::com.mysql.jdbc.Driver
      config = YAML.load_file("database.yml")
      user = config["development"]
      connSelect = java.sql.DriverManager.get_connection(user["url"], user["usermame"], user["password"])
      stmtSelect = connSelect.create_statement

      # Define the query
      selectquery = %q{SELECT title, author FROM books}

      # Execute the query
      rsS = stmtSelect.execute_query(selectquery)

      ary = []
      # For each row returned do some stuff
      while (rsS.next)
        ary << [rsS.getObject("title"), rsS.getObject("author")]
      end
      # puts ary.sort_by {|k| k[/\d+/].to_i}
    end
    # Close off the connection
    stmtSelect.close
    connSelect.close
    ary.sort!
  end
end
