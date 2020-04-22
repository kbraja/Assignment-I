module Locators
    class AssignmentHome

        attr_accessor :LOCATION
        attr_accessor :GO_BUTTON
        attr_accessor :NEXT_BUTTON
        attr_accessor :COMMENT
        attr_accessor :SKIP_BUTTON

        def initialize
            @LOCATION = TextBox.new(:css,"input.postal-code")
            @GO_BUTTON = Button.new(:xpath,"//button[text()[contains(.,'Go')]]")
            @NEXT_BUTTON = Button.new(:xpath, "//button[text()='Next']")
            @COMMENT = TextBox.new(:css,"textarea.text-area__textArea___2N_HC")
            @SKIP_BUTTON = Button.new(:xpath,"//button[text()='Skip']")
        end

        def selectLocation(location)
            return Locator.new(:xpath,"//div[@data-val='"+location+"']/b[text()='"+location+"']")
        end

        def selectThings(part)
            return Locator.new(:xpath,"//div[text()='"+part+"']")
        end

        def selectAction(action)
            return Locator.new(:xpath,"//div[text()='"+action+"']")
        end

        def selectReason(reason)
            return Locator.new(:xpath,"//div[text()='"+reason+"']")
        end

        def selectDateOption(option)
            return Locator.new(:xpath,"//div[text()='"+option+"']")
        end
    end
end