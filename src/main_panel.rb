require "java"
java_import java.awt.Color;
java_import javax.swing.JLabel
java_import javax.swing.JPanel
java_import javax.swing.JButton

class MainPanel < JPanel

  def initialize(m,s)
    super()
    @mf = m
    self.set_name("main")
    self.set_layout(nil)
    self.set_size(600, 500)
    paneltitle = JLabel.new("MainPanel")
    paneltitle.set_bounds(0, 0, 600, 500)
    self.add(paneltitle)

    btn = JButton.new("All Book")
    btn.set_bounds(225, 200, 150, 40)
    btn.add_action_listener do |e|
      pc("all_book")
    end
    self.add(btn)

    btn2 = JButton.new("Search Books")
    btn2.set_bounds(225, 300, 150, 40)
    btn2.add_action_listener do |e|
        pc("search_info")
    end
    self.add(btn2)

    btn3 = JButton.new("Add Books")
    btn3.set_bounds(225, 400, 150, 40)
    btn3.add_action_listener do |e|
      pc("add_date")
    end
    self.add(btn3)

  end

  def pc(str)
    @mf.PanelChange(self, str)
  end
end
