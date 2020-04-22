require 'selenium-webdriver'
require 'date'
describe 'Assignment - Boopathiraja' do
    
    #Browser initialization
    before(:all) do
        # @driver = Selenium::WebDriver.for :chrome
        @driver = Driver.new
        @data_conf = YAML.load_file('conf/data_conf.yml')
        @base_url = @data_conf['account_details']['base_url']
        @wait = Selenium::WebDriver::Wait.new(:timeout => 20,interval: 5)
        @assignment_home = Pages::WebActions::AssignmentHome.new(@driver)
    end

    #Load the Page
    before(:each) do
        @driver.get(@base_url)
    end

    it 'test case' do
        location_to_be_selected = 'Chennai'
        @assignment_home.chooseLocation(location_to_be_selected)
        
        part1 = ['Tap']
        @assignment_home.chooseThings(part1)

        action1 = ['Replace']
        @assignment_home.chooseAction(action1)

        reason1 = ['Leak in a pipe']
        @assignment_home.chooseReason(reason1)

        sampleText = 'Replacement needed in urgent'
        @assignment_home.comment(sampleText)
        
        dateOption = 'On a specific date'
        @assignment_home.chooseDateOption(dateOption)
        date = Date.today + 2
        targetDate = date.strftime('%d')
        targetMonth = date.strftime('%B')
        targetYear = date.strftime('%Y')
        @assignment_home.chooseData(targetDate,targetMonth,targetYear)

        slot = '03:00'
        duration = '4'
        @assignment_home.chooseSlot(slot,duration)

        @wait.until{(@assignment_home.EMAIL).displayed?}
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