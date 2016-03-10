require "java"
require "./main_panel.rb"
require "./all_book.rb"
require "./book_finder.rb"
require "./search_info.rb"
require "./add_date.rb"

java_import javax.swing.JFrame
java_import javax.swing.JPanel
java_import javax.swing.JLabel

class MainFrame < JFrame

  def initialize()
    super "translation"
    @pname = ["main", "all_book", "search_info", "add_date"]
    @mp = MainPanel.new(self, @pname[0])
    @sp = AllBook.new(self, @pname[1])
    @sp2 = SearchInfo.new(self, @pname[2])
    @sp3 = Add_Date.new(self, @pname[3])
    add(@mp)
    add(@sp)
    add(@sp2)
    add(@sp3)
    @mp.visible = true
    @sp.visible = false
    @sp2.visible = false
    @sp3.visible = false
    self.set_bounds(100, 100, 600, 500)
  end

  def PanelChange(jp, str)
    puts jp.get_name
    name = jp.get_name
    if name == @pname[0]
      @mp.visible = false
    elsif name == @pname[1]
      @sp.visible = false
    elsif name == @pname[2]
      @sp2.visible = false
    elsif name == @pname[3]
      @sp3.visible = false
    end

    if str == @pname[0]
      puts "main"
      @mp.visible = true
    elsif str == @pname[1]
      puts "list"
      @sp.remove_sp
      @sp.update
      @sp.visible = true
    elsif str == @pname[2]
      puts "search_info"
      @sp2.visible = true
    elsif str == @pname[3]
      puts "add_date"
      @sp3.visible = true
    end
  end
end
$book = BookFinder.new
mf = MainFrame.new
mf.default_close_operation = JFrame::EXIT_ON_CLOSE
mf.visible = true
