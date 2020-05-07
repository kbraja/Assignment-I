module Locator    
    class AssignmentLocator
            LOCATION_TEXTBOX = {css: "input.postal-code"}
            GO_BUTTON = {xpath: "//button[text()[contains(.,'Go')]]"}
            NEXT_BUTTON = {xpath: "//button[text()='Next']"}
            BACK_BUTTON = {xpath: "//button[text()='Back']"}
            SKIP_BUTTON = {xpath: "//button[text()='Skip']"}
            OTHER_PART = {xpath: "//input[@class[contains(.,'text-field__input')]]"}
            COMMENT = {css: "textarea.text-area__textArea___2N_HC"}
            NEXT_MONTH = {css: "i.styles__nextIcon___PJOhO"}
            CHOOSEN_MONTH = {xpath: "//div[@class[contains(.,'CalendarMonth')] and @data-visible='true']/div[@class[contains(.,'CalendarMonth_caption')]]"}
            TIME_SLOT = {xpath: "//select[@class[contains(.,'select__selectBoxInput')]]"}
            DURATION = {xpath: "//input[@class[contains(.,'text-field')]]"}
            EMAIL = {xpath: "//input[@class[contains(.,'text-field__input')]]"}
            PARTS_TITLE = {xpath: "//div[text()='The problems are to do with which of the following things?']"}
            ACTIONS_TITLE = {xpath: "//div[text()='What do you need done?']"}
            REASON_TITLE = {xpath: "//div[text()='What problem(s) do you have?']"}

            def selectLocation(location)
                return @driver.find_element(:xpath,"//div[@data-val='"+location+"']/b[text()='"+location+"']")
            end
    
            def selectThings(part)
                return @driver.find_element(:xpath,"//div[text()[contains(.,'"+part+"')]]")
            end
    
            def selectAction(action)
                return @driver.find_element(:xpath,"//div[text()[contains(.,'"+action+"')]]")
            end
    
            def selectReason(reason)
                return @driver.find_element(:xpath,"//div[text()[contains(.,'"+reason+"')]]")
            end
    
            def selectDateOption(option)
                return @driver.find_element(:xpath,"//div[text()[contains(.,'"+option+"')]]")
            end
    
            def selectDate(date)
                return @driver.find_element(:xpath,"//button[@aria-label[contains(.,'"+date+"')]]")
            end
    
            def selectSlot(slot)
                return @driver.find_element(:xpath,"//option[text()[contains(.,'"+slot+"')]]")
            end
            
            def getEmail()
                return @driver.find_element(EMAIL)
            end
    
    end
end
