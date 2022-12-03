App Name: culibraries+
App Tagline: A Guide to Cornell's Libraries 
Link(s) to any other public GitHub repo(s) of your app. If you have one repo for iOS / Android and one for Backend, please link to your backend repo in your iOS / Android README, and your iOS / Android repo in your backend README.
Backend Repo: https://github.com/ignaziopr/Libraries-

Some screenshots of your app (highlight important features): 
<img width="386" alt="presentViewController" src="https://user-images.githubusercontent.com/119715651/205421089-52a216b9-6fd8-47b4-936d-08ad05400902.png">
<img width="386" alt="ratingStar" src="https://user-images.githubusercontent.com/119715651/205421090-66abc796-ee4d-4d07-853c-6d0d4057bc70.png">
<img width="386" alt="viewcontroller" src="https://user-images.githubusercontent.com/119715651/205421091-90010440-a859-4a9d-ab5e-589c432da5a8.png">

A short description of your app (its purpose and features): Our application is meant for students to open up and find information about their available libraries. They will be able to find a description of the library, an address, and with features such as a map and a favorite star. Students will also be able to rate the library.
A list of how your app addresses each of the requirements:
  -Delegation: "Rate Library" button send info back to the main page
  -NSLayoutConstraint: Used to place labels and buttons for example
  -Navigation: Push and present view controllers are on the app. "LibraryViewController" is for example a present view controller that showcases a library
  -Backend Integration: getLibraries, getMap, and star are examples of our attempts to integrate the backend. 
Anything else you want your grader to know: We tried our hardest on the backend but it was failing constantly.
Note: The link, screenshots, and description will be used for the Hack Challenge website where we will showcase everyone’s final projects
