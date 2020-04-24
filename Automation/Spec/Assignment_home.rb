module Pages
        class AssignmentHome 
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

            def initialize(driver)
                @driver = driver
                @wait = Selenium::WebDriver::Wait.new(:timeout => 10)
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
          
            def getEmail()
                return @driver.find_element(EMAIL)
            end

            #page function

            #function to click the GO Button
            def clickGoButton()
                @driver.find_element(GO_BUTTON).click()
            end

            #function to click the NEXT Button
            def clickNextButton()
                @driver.find_element(NEXT_BUTTON).click()
            end

            #function to click the BACK Button
            def clickBackButton()
                @driver.find_element(BACK_BUTTON).click()
            end
            
            #function to click the SKIP Button
            def clickSkipButton()
                @driver.find_element(SKIP_BUTTON).click()
            end

            #function to choose a location
            #
            #@param location[String] Location to be choosen
            def chooseLocation(location)
                @driver.find_element(LOCATION_TEXTBOX).clear()
                @driver.find_element(LOCATION_TEXTBOX).send_keys(location)
                @wait.until{selectLocation(location).displayed?}
                selectLocation(location).click()
                @wait.until{ @driver.find_element(NEXT_BUTTON).displayed?}
                clickNextButton()
            end

            #function to choose a part
            #
            #@param parts[Array] List of parts to be choosen
            def chooseThings(parts)
                for part in parts do
                    if part.include? 'Other'
                        @driver.find_element(OTHER_PART).click()
                        mention = part.split("-")
                        @driver.find_element(OTHER_PART).send_keys(mention[1])
                    else
                        selectThings(part).click() 
                    end
                end
                clickNextButton()
            end

            #function to choose a action
            #
            #@param actions[Array] List of actions to be choosen
            def chooseAction(actions)
                for action in actions do
                    selectAction(action).click()
                end
                clickNextButton()
            end

            #function to choose a reason
            #
            #@param reasons[String] reason to be given
            def chooseReason(reasons)
                for reason in reasons do
                    selectReason(reason).click()
                end
                clickNextButton()
            end

            #function to write a comment
            #
            #@param text[String] comment to be provided
            def comment(text=nil)
                if(text!=nil)
                    @driver.find_element(COMMENT).clear()
                    @driver.find_element(COMMENT).send_keys(text)
                    clickNextButton()
                else
                    clickSkipButton()
                end
            end

            #function to choose a date option
            #
            #@param option[String] option to be choosen
            def chooseDateOption(option)
                selectDateOption(option).click()
                clickNextButton()
            end

            #function to choose a date 
            #
            #@param noOfDayFromCurrentday[Integer] number of day from current day
            def chooseData(noOfDayFromCurrentday=1)
                date = Date.today + noOfDayFromCurrentday
                targetDate = date.strftime('%d').to_i
                targetMonth = date.strftime('%B')
                targetYear = date.strftime('%Y')

                current_month_year = @driver.find_element(CHOOSEN_MONTH).text()
                target_month_year = date.strftime('%B %Y')
                while(current_month_year!=target_month_year ) do
                    @driver.find_element(NEXT_MONTH).click()
                    @wait.until{ @driver.find_element(CHOOSEN_MONTH).displayed?}
                    current_month_year = @driver.find_element(CHOOSEN_MONTH).text()
                end
                dateToBeSelected = targetMonth+' '+targetDate.to_s+', '+targetYear
                selectDate(dateToBeSelected).click()
                clickNextButton()
            end

            #function to choose a slot 
            #
            #@param slot[String] slot to be selected
            #@param duration[String] duration to be selected
            def chooseSlot(slot,duration=nil)
                timeSlot = @driver.find_element(TIME_SLOT)
                options = timeSlot.find_elements(tag_name: 'option')
                options.each { |option| option.click if option.text == slot}
                if(duration!=nil)
                    @driver.find_element(DURATION).clear()
                    @driver.find_element(DURATION).send_keys(duration)
                end
                clickNextButton() 
            end

            #function to fill email
            #
            #@param email[String] email to be written
            def fillEmail(email)
                @driver.find_element(EMAIL).clear()
                @driver.find_element(EMAIL).send_keys(email)
            end
 
        end
end
