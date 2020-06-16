# CanaryHomework
The app displays a list of system devices, each detailing information on sensor data readings.

## Running the project
Opening the project in XCode and selecting any of the iOS simulators should get the app up and running. 

## Design
- Used MVVM pattern to prevent bloated view controllers, improve testability (ease of updating a view with fake data) 

## TODO
- [ ]  Improve testability, pass in CoreDataManager and CoreDataContoller to classes that require them, so they can be mocked in tests
- [ ] Unit Tests (This was listed in the homework challenge, but due to my unfamiliarity with ObjC and running quite past the expected time-spent, I've decided to skip this portion) Below are some of the tests/related files I would add:
    - Dummy JSON files for a device, list of devices, list of readings
    - Tests for calculations in DetailViewModel and returned strings
    - Tests for the fetches in ViewController and DetailViewController to make sure the views are updated with new data

- [ ]  Snapshot Tests
    - tableView in ViewController
    - DetailView

        
