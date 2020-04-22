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

            def clickSkipButton()
                @SKIP_BUTTON.click()
            end

            def chooseThings(parts)
                for part in parts do
                    selectThings(part).move_and_click()
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

            def chooseDateOption(option,date=null,comment=null)
                selectDateOption(option).click()
                clickNextButton()
                if(option=='On a specific date')
                    chooseData[]
                elsif(option=='Other(I will need to confirm)')

                end

            def chooseData(date,month,year)
                current_month_year = Time.new.strftime('%B %Y')
                target_month_year = month+' '+year
                while(current_month_year!=target_month_year ) do
                    @NEXT_MONTH.click()
                end
                selectDate(date).click()
                clickNextButton()
            end

            
        end
    end
end