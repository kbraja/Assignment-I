require 'selenium-webdriver'
module Pages
        class AssignmentHome 
            def initialize(driver)
                @driver = driver
            end

            def clickGoButton()
                @driver.find_element(:xpath,"//button[text()[contains(.,'Go')]]").click()
            end

            def clickNextButton()
                @driver.find_element(:xpath, "//button[text()='Next']").click()
            end

            def clickBackButton()
                @driver.find_element(:xpath, "//button[text()='Back']").click()
            end

            def clickSkipButton()
                @driver.find_element(:xpath,"//button[text()='Skip']").click()
            end

            def chooseLocation(location)
                @driver.find_element(:css,'input.postal-code').clear()
                @driver.find_element(:css,'input.postal-code').send_keys(location)
                selectLocation(location).click()
                clickGoButton()
                clickNextButton()
            end

            def chooseThings(parts)
                for part in parts do
                    if part.include? 'Other'
                        @driver.find_element(:xpath,"//input[@class[contains(.,'text-field__input')]]").click()
                        mention = part.split("-")
                        @driver.find_element(:xpath,"//input[@class[contains(.,'text-field__input')]]").send_keys(mention[1])
                    else
                        selectThings(part).click() 
                    end
                end
                clickNextButton()
            end

            def chooseAction(actions)
                for action in actions do
                    selectAction(action).click()
                end
                clickNextButton()
            end

            def chooseReason(reasons)
                for reason in reasons do
                    selectReason(reason).click()
                end
                clickNextButton()
            end

            def comment(text=nil)
                if(text!=nil)
                    @driver.find_element(:css,"textarea.text-area__textArea___2N_HC").clear()
                    @driver.find_element(:css,"textarea.text-area__textArea___2N_HC").send_keys(text)
                    clickNextButton()
                else
                    clickSkipButton()
                end
            end

            def chooseDateOption(option)
                selectDateOption(option).click()
                clickNextButton()
            end

            def chooseData(date,month,year)
                current_month_year = Time.new.strftime('%B %Y')
                target_month_year = month+' '+year
                while(current_month_year!=target_month_year ) do
                    @driver.find_element(:css,"i.styles__nextIcon___PJOhO").click()
                end
                dateToBeSelected = month+' '+date+', '+year
                selectDate(dateToBeSelected).click()
                clickNextButton()
            end

            def chooseSlot(slot,duration=nil)
                timeSlot = @driver.find_element(:xpath,"//select[@class[contains(.,'select__selectBoxInput')]]")
                options = timeSlot.find_elements(tag_name: 'option')
                options.each { |option| option.click if option.text == slot}
                if(duration!=nil)
                    @driver.find_element(:xpath,"//input[@class[contains(.,'text-field')]]").clear()
                    @driver.find_element(:xpath,"//input[@class[contains(.,'text-field')]]").send_keys(duration)
                end
                clickNextButton() 
            end

            def fillEmail(email)
                @driver.find_element(:xpath,"//input[@class[contains(.,'text-field__input')]]").clear()
                @driver.find_element(:xpath,"//input[@class[contains(.,'text-field__input')]]").send_keys(email)
            end

            #locator function
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

        end
    end
end