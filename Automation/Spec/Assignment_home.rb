require_relative 'Assignment_locator.rb'
module Pages
        class AssignmentHome < Locator::AssignmentLocator

            def initialize(driver)
                @driver = driver
                @wait = Selenium::WebDriver::Wait.new(:timeout => 10)
            end
            
            # function to click the GO Button
            def clickGoButton()
                @driver.find_element(GO_BUTTON).click()
            end

            # function to click the NEXT Button
            def clickNextButton()
                @driver.find_element(NEXT_BUTTON).click()
            end

            # function to click the BACK Button
            def clickBackButton()
                @driver.find_element(BACK_BUTTON).click()
            end
            
            # function to click the SKIP Button
            def clickSkipButton()
                @driver.find_element(SKIP_BUTTON).click()
            end

            # function to choose a location
            #
            # @param location[String] Location to be choosen
            def chooseLocation(location)
                @driver.find_element(LOCATION_TEXTBOX).clear()
                @driver.find_element(LOCATION_TEXTBOX).send_keys(location)
                @wait.until{selectLocation(location).displayed?}
                selectLocation(location).click()
                @wait.until{ @driver.find_element(NEXT_BUTTON).displayed?}
                clickNextButton()
            end

            # function to choose a part
            #
            # @param parts[Array] List of parts to be choosen
            def chooseThings(parts)
                @wait.until{ @driver.find_element(PARTS_TITLE).displayed?}
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

            # function to choose a action
            #
            # @param actions[Array] List of actions to be choosen
            def chooseAction(actions)
                @wait.until{ @driver.find_element(ACTIONS_TITLE).displayed?}
                for action in actions do
                    selectAction(action).click()
                end
                clickNextButton()
            end

            # function to choose a reason
            #
            # @param reasons[String] reason to be given
            def chooseReason(reasons)
                @wait.until{ @driver.find_element(REASON_TITLE).displayed?}
                for reason in reasons do
                    selectReason(reason).click()
                end
                clickNextButton()
            end

            # function to write a comment
            #
            # @param text[String] comment to be provided
            def comment(text=nil)
                if(text!=nil)
                    @driver.find_element(COMMENT).clear()
                    @driver.find_element(COMMENT).send_keys(text)
                    clickNextButton()
                else
                    clickSkipButton()
                end
            end

            # function to choose a date option
            #
            # @param option[String] option to be choosen
            def chooseDateOption(option)
                selectDateOption(option).click()
                clickNextButton()
            end

            # function to choose a date 
            #
            # @param noOfDayFromCurrentday[Integer] number of day from current day
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

            # function to choose a slot 
            #
            # @param slot[String] slot to be selected
            # @param duration[Integer] duration to be selected
            def chooseSlot(slot,duration=nil)
                timeSlot = @driver.find_element(TIME_SLOT)
                options = timeSlot.find_elements(tag_name: 'option')
                options.each { |option| option.click if option.text == slot}
                if(duration!=nil)
                    @driver.find_element(DURATION).clear()
                    @driver.find_element(DURATION).send_keys(duration.to_s)
                end
                clickNextButton() 
            end

            # function to fill email
            #
            # @param email[String] email to be written
            def fillEmail(email)
                @driver.find_element(EMAIL).clear()
                @driver.find_element(EMAIL).send_keys(email)
            end
 
        end
end
