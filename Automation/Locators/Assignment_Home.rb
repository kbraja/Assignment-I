require 'selenium-webdriver'
module Locators
    class AssignmentHome

        attr_accessor :LOCATION
        attr_accessor :GO_BUTTON
        attr_accessor :NEXT_BUTTON
        attr_accessor :BACK_BUTTON
        attr_accessor :OTHER_PART
        attr_accessor :COMMENT
        attr_accessor :SKIP_BUTTON
        attr_accessor :NEXT_MONTH
        attr_accessor :TIME_SLOT
        attr_accessor :DURATION
        attr_accessor :EMAIL

        def initialize
            @LOCATION = @driver.driver.find_element(:css,'input.postal-code')
            @GO_BUTTON = @driver.driver.find_element(:xpath,"//button[text()[contains(.,'Go')]]")
            @NEXT_BUTTON = @driver.driver.find_element(:xpath, "//button[text()='Next']")
            @BACK_BUTTON = @driver.driver.find_element(:xpath, "//button[text()='Back']")
            @OTHER_PART = @driver.driver.find_element(:xpath,"//input[@class[contains(.,'text-field__input')]]")
            @COMMENT = @driver.driver.find_element(:css,"textarea.text-area__textArea___2N_HC")
            @SKIP_BUTTON = @driver.driver.find_element(:xpath,"//button[text()='Skip']")
            @NEXT_MONTH = @driver.driver.find_element(:css,"i.styles__nextIcon___PJOhO")
            @TIME_SLOT = @driver.driver.find_element(:xpath,"//select[@class[contains(.,'select__selectBoxInput')]]")
            @DURATION = @driver.driver.find_element(:xpath,"//input[@class[contains(.,'text-field')]]")
            @EMAIL = @driver.driver.find_element(:xpath,"//input[@class[contains(.,'text-field__input')]]")
        end

        def selectLocation(location)
            return @driver.driver.find_element(:xpath,"//div[@data-val='"+location+"']/b[text()='"+location+"']")
        end

        def selectThings(part)
            return @driver.driver.find_element(:xpath,"//div[text()[contains(.,'"+part+"')]]")
        end

        def selectAction(action)
            return @driver.driver.find_element(:xpath,"//div[text()[contains(.,'"+action+"')]]")
        end

        def selectReason(reason)
            return @driver.driver.find_element(:xpath,"//div[text()[contains(.,'"+reason+"')]]")
        end

        def selectDateOption(option)
            return @driver.driver.find_element(:xpath,"//div[text()[contains(.,'"+option+"')]]")
        end

        def selectDate(date)
            return @driver.driver.find_element(:xpath,"//button[@aria-label[contains(.,'"+date+"')]]")
        end

        def selectSlot(slot)
            return @driver.driver.find_element(:xpath,"//option[text()[contains(.,'"+slot+"')]]")
        end
    end
end