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
            @LOCATION = TextBox.new(:css,"input.postal-code")
            @GO_BUTTON = Button.new(:xpath,"//button[text()[contains(.,'Go')]]")
            @NEXT_BUTTON = Button.new(:xpath, "//button[text()='Next']")
            @BACK_BUTTON = Button.new(:xpath, "//button[text()='Back']")
            @OTHER_PART = TextBox.new(:xpath,"//input[@class[contains(.,'text-field__input')]]")
            @COMMENT = TextBox.new(:css,"textarea.text-area__textArea___2N_HC")
            @SKIP_BUTTON = Button.new(:xpath,"//button[text()='Skip']")
            @NEXT_MONTH = Locator.new(:css,"i.styles__nextIcon___PJOhO")
            @TIME_SLOT = Locator.new(:xpath,"//select[@class[contains(.,'select__selectBoxInput')]]")
            @DURATION = TextBox.new(:xpath,"//input[@class[contains(.,'text-field')]]")
            @EMAIL = TextBox.new(:xpath,"//input[@class[contains(.,'text-field__input')]]")
        end

        def selectLocation(location)
            return Locator.new(:xpath,"//div[@data-val='"+location+"']/b[text()='"+location+"']")
        end

        def selectThings(part)
            return Locator.new(:xpath,"//div[text()[contains(.,'"+part+"')]]")
        end

        def selectAction(action)
            return Locator.new(:xpath,"//div[text()[contains(.,'"+action+"')]]")
        end

        def selectReason(reason)
            return Locator.new(:xpath,"//div[text()[contains(.,'"+reason+"')]]")
        end

        def selectDateOption(option)
            return Locator.new(:xpath,"//div[text()[contains(.,'"+option+"')]]")
        end

        def selectDate(date)
            return Locator.new(:xpath,"//button[@aria-label[contains(.,'"+date+"')]]")
        end

        def selectSlot(slot)
            return Locator.new(:xpath,"//option[text()[contains(.,'"+slot+"')]]")
        end
    end
end