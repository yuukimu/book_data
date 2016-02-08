require "java"
java_import javax.swing.JLabel
java_import javax.swing.JPanel
java_import javax.swing.JButton
java_import javax.swing.JTextField;

class SearchInfo < JPanel
  def initialize(m, s)
    super()
    @mf = m
    self.set_name("search_info")
    self.set_layout(nil)
    self.set_size(600, 500)

    title_label = JLabel.new("title")
    title_label.set_bounds(20, 20, 50, 50)
    self.add(title_label)

    text1 = JTextField.new
    text1.set_bounds(60, 30, 205, 30)
    self.add(text1)

    auth_label = JLabel.new("author")
    auth_label.set_bounds(20, 80, 50, 50)
    self.add(auth_label)

    text2 = JTextField.new
    text2.set_bounds(60, 90, 205, 30)
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

    btn3 = JButton.new("Add Books")
    btn3.set_bounds(440, 430, 150, 40)
    # btn3.add_action_listener do |e|
    #   puts text1.get_text
    # end
    self.add(btn3)

    btn4 = JButton.new("Search")
    btn4.set_bounds(225, 300, 150, 40)
    self.add(btn4)
  end

  def pc(str)
    @mf.PanelChange(self, str)
  end
end