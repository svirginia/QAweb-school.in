#Author: Virginia Sanabria		 
#Version: 1.0
#Date: 06 Jul 2016
#Updated at   | Update by
#07 Jul 2016  | Mario Perez
#09 Jul 2016  | Paola Munoz

def tableGrid
	@tableGrid ||=TableGrid.new
end

class TableGrid
	include Capybara::DSL

	def initialize
		@search_box = '#search'
		@edit_icon = '.glyphicon.glyphicon-pencil'
		@remove_icon = '.glyphicon.glyphicon-remove'
		@table_cell = 'table.items td'
		@no_resutls = 'table.items span.empty'
		@alert = WaitAlertMsg.new
	end
	
	def set_search_box(value)
		page.find(@search_box).set value
	end

	def click_edit_icon()
		page.find(@edit_icon).click
	end

	def click_remove_icon()
		page.find(@remove_icon).click
		@alert.waitUntilAlertPresent_and_accept
	end

	def is_no_result_message_displayed(message)
        page.has_css?(@no_resutls, :text => message)
	end

	def is_value_displayed_in_first_row(value)
		page.has_css?(@table_cell, :text => value, :match => :prefer_exact)
	end

	def click_eye_edit_icon_by_value(value)
		page.find(:xpath, "//tr[contains(.,'"+value+"')]/td/a[contains(@class,'eye')]").click		
	end 

	def click_remove_icon_by_value(value)	
		page.find(:xpath, "//tr[contains(.,'"+value+"')]/td/a[contains(@href,'delete')]").click
		@alert.waitUntilAlertPresent_and_accept
	end 

	def click_edit_icon_by_value(value)
		page.find(:xpath, "//tr[contains(.,'"+value+"')]/td/a[contains(@href,'update')]").click		
	end 

end