require 'date'
describe 'Assignment - Boopathiraja' do
    
    #Browser initialization
    before(:all) do
        @base_url = 'https://www.starofservice.in/dir/telangana/hyderabad/hyderabad/plumbing#/'
        @driver = Driver.new
        @assignment_home = Pages::WebActions::AssignmentHome.new(@driver)
    end

    #Load the Page
    before(:each) do
        @driver.get(@base_url)
    end

    it 'test case' do
        location_to_be_selected = 'Chennai'
        part1 = ['Tap']
        action1 = ['Replace']
        reason1 = ['Leak in a pipe']
        sampleText = 'Replacement needed in urgent'
        dateOption = 'On a specific date'
        @assignment_home.chooseLocation(location_to_be_selected)
        
        @assignment_home.chooseThings(part1)

        @assignment_home.chooseAction(action1)

        @assignment_home.chooseReason(reason1)

        @assignment_home.comment(sampleText)

        @assignment_home.chooseDateOption(dateOption)

        date = Date.today + 2
        targetDate = date.strftime('%d')
        targetMonth = date.strftime('%B')
        targetYear = date.strftime('%Y')
        @assignment_home.chooseData(targetDate,targetMonth,targetYear) 
    end

    #Close Browser
    after(:each) do
        @driver.close()
    end

    #Quit Browser
    after(:all) do
        @driver.quit()
    end
end