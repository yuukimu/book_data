require 'java'
require "./book_finder.rb"
java_import javax.swing.JPanel
java_import java.awt.BorderLayout
java_import javax.swing.JTable
java_import javax.swing.JScrollPane
java_import javax.swing.JButton
java_import java.awt.Dimension

class Table < JPanel

  def initialize(m, s)
    super()
    @mf = m
    self.set_name("table")
    book = BookFinder.new
    @tabledata = book.book_list
    @column_names = ["title", "author"]
    self.set_bounds(0, 0, 600, 400)

    tablemodel = javax.swing.table.DefaultTableModel.new
    @column_names.each do |col|
      tablemodel.add_column(col)
    end
    table = JTable.new(tablemodel)

    @tabledata.each do |date|
      tablemodel.add_row(date.to_java)
    end

    sp = JScrollPane.new(table)
    sp.set_preferred_size(Dimension.new(600, 400))

    self.add(sp)

    btn = JButton.new("MainPanel")
    btn.set_bounds(20, 450, 150, 40)
    btn.add_action_listener do |e|
      pc("main")
    end
    self.add(btn)
  end

  def pc(str)
    @mf.PanelChange(self, str)
  end
end