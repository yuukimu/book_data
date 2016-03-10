require 'java'
java_import javax.swing.JPanel
java_import java.awt.BorderLayout
java_import javax.swing.JTable
java_import javax.swing.JScrollPane
java_import javax.swing.JButton
java_import java.awt.Dimension

class AllBook < JPanel

  def initialize(m, s)
    super()
    @mf = m
    self.set_name("all_book")
    self.set_layout(nil)
    self.set_size(600, 500)
    @column_names = ["title", "author"]
    update

    btn = JButton.new("Main Panel")
    btn.set_bounds(10, 430, 150, 40)
    btn.add_action_listener do |e|
      pc("main")
    end
    self.add(btn)

    btn2 = JButton.new("Search Books")
    btn2.set_bounds(225, 430, 150, 40)
    btn2.add_action_listener do |e|
        pc("search_info")
    end
    self.add(btn2)

    btn3 = JButton.new("Add Books")
    btn3.set_bounds(440, 430, 150, 40)
    btn3.add_action_listener do |e|
      pc("add_date")
    end
    self.add(btn3)
  end

  def update
    @tabledata = $book.book_list
    tablemodel = javax.swing.table.DefaultTableModel.new
    @column_names.each do |col|
      tablemodel.add_column(col)
    end
    table = JTable.new(tablemodel)

    @tabledata.each do |date|
      tablemodel.add_row(date.to_java)
    end

    @sp = JScrollPane.new(table)
    @sp.set_preferred_size(Dimension.new(600, 400))
    @sp.set_bounds(0, 0, 600, 400)
    self.add(@sp)
  end

  def remove_sp
    self.remove(@sp)
  end

  def pc(str)
    @mf.PanelChange(self, str)
  end
end