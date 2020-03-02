# JsonToUI
Load json from api and display contents in UI

An iOS assignment with below mentioned requirements:

Build an iOS application which lists name, image and price of products.
You are encouraged to implement it in a grid layout.

Show additional details about an individual product i.e. description etc. when tapped. Feel free to implement your design here.

Note: 
You need to change the end points as per your need:

Looking at the code we can understand the flow of design pattern's. 
MVC and MVVM can be understood by going through.

There are some helper/utility classes in order to simplify the ease of use:
	•	Constants.swift used in terms to store some project level constants.
	•	Utility.swift is actually containing some extra global feature's for String, Attributed String and UIView.


The JSON parsing is done by using Codable swift feature.
APICallerModel is responsible for loading the products (API call related operations)
RMImageManager is responsible for making API calls to load an image and try to cache as needed.


The project contains two screens:
	•	The first view is regarding the list of products available, displayed with basic minimal information in grid layout. This can be see in ProductsViewController.swift file.
	•	The second view is displaying the details of particular product user has tapped on. This is using mostly MVVM pattern on UITableView contained within ProductDetailsViewController.swift file.
	⁃	RMProfileDescriptionModel is used to handle the data for product details (can be visualised as ViewModel)
	
Few animations are implemented in order to just enhance the User experience.
