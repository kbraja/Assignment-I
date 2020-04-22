require 'selenium-webdriver'
module Pages
    module WebActions
        class AssignmentHome < Locators::AssignmentHome
            def initialize(driver)
                super()
                @driver = driver
            end

            def chooseLocation(location)
                @LOCATION.clear()
                @LOCATION.send_keys(location)
                selectLocation(location).click()

                clickGoButton()

                clickNextButton()
            end

            def clickGoButton()
                @GO_BUTTON.click()
            end

            def clickNextButton()
                @NEXT_BUTTON.click()
            end

            def clickBackButton()
                @BACK_BUTTON.click()
            end

            def clickSkipButton()
                @SKIP_BUTTON.click()
            end

            def chooseThings(parts)
                for part in parts do
                    if part.include? 'Other'
                        @OTHER_PART.click()
                        mention = part.split("-")
                        @OTHER_PART.send_keys(mention[1])

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
                    @COMMENT.clear()
                    @COMMENT.send_keys(text)
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
                    @NEXT_MONTH.click()
                end
                dateToBeSelected = month+' '+date+', '+year
                selectDate(dateToBeSelected).click()
                clickNextButton()
            end

            def chooseSlot(slot,duration=nil)
                timeSlot = @driver.find_element(@TIME_SLOT)
                options = timeSlot.find_elements(tag_name: 'option')
                options.each { |option| option.click if option.text == slot}
                if(duration!=nil)
                    @DURATION.clear()
                    @DURATION.send_keys(duration)
                end
                clickNextButton() 
            end

            def fillEmail(email)
                @EMAIL.clear()
                @EMAIL.send_keys(email)
            end
            
        end
    end
end