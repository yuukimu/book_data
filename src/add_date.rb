require "java"
java_import javax.swing.JLabel
java_import javax.swing.JPanel
java_import javax.swing.JButton
java_import javax.swing.JTextField
java_import java.awt.Font

class Add_Date < JPanel
  def initialize(m, s)
    super()
    @mf = m
    self.set_name("add_date")
    self.set_layout(nil)
    self.set_size(600, 500)

    page_title = JLabel.new("Add Date")
    page_title.set_font(Font.new("Arial", Font::PLAIN, 20))
    page_title.set_bounds(250, 10, 200, 50)
    self.add(page_title)

    title_label = JLabel.new("title")
    title_label.set_bounds(20, 70, 50, 50)
    self.add(title_label)

    text1 = JTextField.new
    text1.set_bounds(60, 80, 205, 30)
    self.add(text1)

    auth_label = JLabel.new("author")
    auth_label.set_bounds(20, 130, 50, 50)
    self.add(auth_label)

    text2 = JTextField.new
    text2.set_bounds(60, 140, 205, 30)
    self.add(text2)

    btn = JButton.new("Main Panel")
    btn.set_bounds(10, 430, 150, 40)
    btn.add_action_listener do |e|
      pc("main")
    end
    self.add(btn)

    btn2 = JButton.new("All Books")
    btn2.set_bounds(225, 430, 150, 40)
    btn2.add_action_listener do |e|
      pc("all_book")
    end
    self.add(btn2)

    btn3 = JButton.new("Search Books")
    btn3.set_bounds(440, 430, 150, 40)
    # btn3.add_action_listener do |e|
    #   puts text1.get_text
    # end
    self.add(btn3)

    btn4 = JButton.new("Add")
    btn4.set_bounds(225, 300, 150, 40)
    btn4.add_action_listener do |e|
      p $book.add_book(text1.get_text, text2.get_text)
      text1.set_text("")
      text2.set_text("")
    end
    self.add(btn4)
  end

  def pc(str)
    @mf.PanelChange(self, str)
  end
end