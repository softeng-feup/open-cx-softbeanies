# openCX-softbeanies Development Report

Welcome to the documentation pages of the *SimplyFind* of **openCX**!

You can find here detailed information about the (sub)product, hereby mentioned as module, from a high-level vision to low-level implementation decisions, a kind of Software Development Report (see [template](https://github.com/softeng-feup/open-cx/blob/master/docs/templates/Development-Report.md)), organized by discipline (as of RUP): 

* Business modeling 
  * [Product Vision](#Product-Vision)
  * [Elevator Pitch](#Elevator-Pitch)
* Requirements
  * [Use Case Diagram](#Use-case-diagram)
  * [User stories](#User-stories)
  * [Domain model](#Domain-model)
* Architecture and Design
  * [Architectural and design decisions](#Architectural-and-design-decisions)
  * [Logical architecture](#Logical-architecture)
  * [Physical architecture](#Physical-architecture)
  * [Prototype](#Prototype)
* [Implementation](#Implementation)
* Test
* [Change management](#Configuration-and-change-management)
* [Project management](#Project-management)

So far, contributions are exclusively made by the initial team, but we hope to open them to the community, in all areas and topics: requirements, technologies, development, experimentation, testing, etc.

Please contact us! 

Thank you!

*Ana Margarida Ruivo Loureiro,</br>
Gonçalo José Marantes Pimenta da Costa Monteiro,</br>
João Miguel Ribeiro de Castro Silva Martins,</br>
Maria Helena Viegas Oliveira Ferreira*

---
## Product Vision

For attendees who want efficient navigation, Simplyfind is the app that will help guide their way to a searchable spot inside a conference. 

---
## Elevator Pitch

We came up with this project because we understand how hard it is to find our way in a conference building we have never been in. So why would you find your way when *SimplyFind* can do it for you? If you need to go somewhere or you want to decide which activity to go next, just a couple of taps will make sure you go where you wish without **ever** getting lost!

---
## Requirements
### Use case diagram 

<img src= "https://github.com/softeng-feup/open-cx-softbeanies/blob/master/Diagrams/SimplyFind%20Use%20Case%201.jpeg">

#### Description 
This use case represents the possibility to locate a user in the building.

#### Actor 
The user is the actor in this functionality.

#### Preconditions and postconditions
To execute this functionality the user needs to have already chosen an option that ends on the page with the representation of the map building. In the end, it will be present the user location on the map. 

#### Normal flow
After the user goes through one of the preconditions it will trigger a chain of action:

* Request location to the GPS;
* The resulting information will be passed by the backend to the Google Maps API;
* The Google Maps API will display the location of the user. 

#### Alternative Flows and Exceptions

In case the request to the GPS can't be concluded the representation of the location of the user won't be displayed.

<img src= "https://github.com/softeng-feup/open-cx-softbeanies/blob/master/Diagrams/SimplyFind%20Use%20Case%202.jpeg">

#### Description 
This use case represents the location of a POI in the building and display of the route to it.

#### Actor 
The user and server are the actors in this functionality.

#### Preconditions and postconditions
To execute this functionality the user needs to have already navigated in the app and selected any option to calculate a path to a chosen point of interest on the map. In the end, the route to the chosen point will be displayed on the map.

#### Normal flow
After the user goes through the precondition it will trigger a chain of action:

* Request the location of the chosen point of interest to the server;
* The resulting information will be passed to the backend;
* The backend will compute the correct path to the point of interest;
* The information associated with the route will be passed to the Google Maps API;
* The Google Maps API will display the path computed in the backend. 

#### Alternative Flows and Exceptions

In case the point of interest chosen doesn't exist on the database the server's answer will be NULL. However, the page will still be redirected to the result page but the map represented will be empty.

<img src= "https://github.com/softeng-feup/open-cx-softbeanies/blob/master/Diagrams/SimplyFind%20Use%20Case%203.jpeg">

#### Description 
This use case represents the selection and display of a point of interest info.

#### Actor 
The user and server are the actors in this functionality.

#### Preconditions and postconditions
To execute this functionality the user needs to have already chosen an option that ends on the page with the representation of the map building and selects a point of interest displayed there. In the end, the user will be able to see displayed over the point the information to it related.

#### Normal flow
After the user goes through the precondition it will trigger a chain of action:

* Request the information associated with the chosen point of interest to the server;
* The resulting information will be passed to the backend;
* The information will be passed to the Google Maps API;
* The Google Maps API will display the information on top of the point of interest. 

<img src= "https://github.com/softeng-feup/open-cx-softbeanies/blob/master/Diagrams/SimplyFind%20Use%20Cases%20(Full).jpeg">

### User stories

+ As a person with no sense of direction, I would like to have very precise directions to not get lost in the building. Value: XL 

+ As a coffee drinker, I would like to know where the coffee machines are because I don't want to be dependent on the coffee breaks. Value: M

+ As a participant, I would want to know where I could do check-in as soon as I arrived, so I wouldn't have to ask. Value: S

+ As a participant, I would like to know more details about the events occurring in the conference. 

+ As a forgetful person, I would like to know what conferences are going on today because I want a simple way to get this information. Value: L

+ As a speaker, I would like to know the rooms where I am going to give a talk because those are the relevant locations for me. Value: M

+ As a user, I would like to know where my colleagues are if I get lost. Value: XL




### Domain model

<img src= "https://github.com/softeng-feup/open-cx-softbeanies/blob/master/Diagrams/DomainModel.png">


---

## Architecture and Design

### Architectural and design decisions

The software division of the project follows the **MVC (Model-View-Controller)** architectural pattern. As the name implies this pattern divides the structure of the program in three interconnected parts:

-**Model**: It holds the internal information and is independent of the user interface.

-**View**: Represents the visualization of the data that the model contains. 

-**Controller**: Exists between the Model and View working as intermediate of information.

Our project is centered on the implementation of three main parts:

	- Storage of the data;
	
	- Route computation with map integration;
	
	- App design and functionalities;


The information from the server needs to be processed and organized into classes present in the package - Model-POI. 
Those classes allows us to represent the events in the conference and the points of interest associated with them. Furthermore, we implemented a graph with connections that allow us to represent the paths from point to point. This way we can represent the paths available in the building.

Like previously said the graph representation enables us to represent all the paths possible in the building. Hence we can use this representation to compute the routes desired by implementing a simple Dijkstra method. In the end, we have a list of connected points of interest from the origin to the destination point to represent on the map. 

The app design is related to the GUI interface of the application. This includes the associated visual components of the pages and the correct handle of the information requested to present there and also the respective implementation of all the functionalities associated with the GUI.
Also, the map and the display of the routes are developed with the assistance of the **GoogleMapsAPI**.

### Logical architecture

Like we said above the architecture pattern followed in this project was the MVC Model. 
To accomplish this we divided the project into three logical components/packages - **Controller**, **Model-POI** and **Views**. 

The **View** is divided into pages and widgets used namely the GoogleMapsWidget and this component's main functionality is to represent the information stored in the model component.

The **Model** stores all the information into a logical structure supported by related functions.

The **Controller** processes actions triggered by the view to update the model. (ex: by clicking in a button to display a route the user starts a chain of requests where the view communicates to the controller the request; the controller collects the information needed and calculates in the model the route to be the displayed by the view);

<img src= "https://github.com/softeng-feup/open-cx-softbeanies/blob/master/Diagrams/ComponentDiagram.png">

### Physical architecture

In this project, we designed an application for mobile that uses the GPS to locate the user and find the direction to the different points of interest of the conference kept in a database.

The main components of the physical architecture are mobile devices, the database, and GPS.

The technologies used in the project had a lot of research before we came with the final decisions. Initially, we thought to use microbits with Bluetooth to locate the users but we ended up using GPS instead. 
The framework chosen was Flutter (that uses Dart) in detriment to ReactNative since after a time of reflection and investigation we concluded that flutter was more intuitive and better technology for the development of mobile apps for less experienced people.

<img src= "https://github.com/softeng-feup/open-cx-softbeanies/blob/master/Diagrams/DeploymentDiagram.png">

### Prototype

Our application allows a user to choose between two different approaches to navigation.

In the first option, we can choose a point of interest by exploring a menu organized by different categories: lectures, workshops, check-in, food, WC and exits. Here we can select a specific lecture or workshop and look at a detailed explanation about the event before deciding whether we want to compute the path to it. Besides, all the remaining categories that have more than one point of interest associated - bathrooms, food machines and exists - will display all the points in the map so we can choose to which point we want to go and calculate the route.

In the second option, we can introduce with the keyboard the origin and destination in the search bar to compute the path.

This means that we concluded almost every user story we planned to do. Unfortunately, we had to choose to leave the ability to connect users and diferentiate different types of users (speaker, attendee).

However, all the other user stories were concluded with success: 

+ As a person with no sense of direction, I would like to have very precise directions to not get lost in the building - both options of in our application culminate with the ability to show the user the correct direction to a point of interest.

+ As a coffee drinker, I would like to know where the coffee machines are because I don't want to be dependent on the coffee breaks - We incorporated food machines into our database as a point of interest so with a quick search the user will be able to know where he can buy a coffee.

+ As a participant, I would want to know where I could do check-in as soon as I arrived, so I wouldn't have to ask - similar to the coffee machines we incorporated the check-in into our database;

+ As a FEUP student, I'm interested in knowing where the coffee breaks are, and which speakers will be talking at what time because I already know how to find my way at FEUP - the coffee breaks were added to the database; the speakers can be consulted in the menu Explore, in the option "Lectures" where we can see all the available lectures at the time and the respective speakers.

+ As a forgetful person, I would like to know what lectures are going on today because I want a simple way to get this information - by navigating in the menu Explore and choosing "Lectures" we can consult all the available lectures for the day. Furthermore, we can select each lecture for a more detailed description.

---

## Implementation

Most of our app front-end is quite simple in implementation and Flutter provides clear syntax to build pretty interfaces.
However, the key aspect of our app feature resides on the back-end, related to the navigation.

Since how domain is restricted to the main building of FEUP, it's easy to create a set of Points Of Interest that will be related to the conference. These will be considered as nodes of a graph. Then, we define connections between them (edges), having intermediate steps to make the user perception when visualizing the path. Having these sets of nodes and edges, our graph is ready to be created.

From now on the path will be obtained running an algorithm (based on BFS and Dijkstra), which will, in the end, return an ordered list of the POI to be traveled.

Finally, this list will be passed to the front-end, so the Google Maps widget receives it and display the path on the screen.

In our product development final stage we switched from our own local stored database to the one provided in the open-cx server and then allowing future changes in the locations needed for the conference.

---

## Test

For the verification of the widgets and the behavior of the app we done unit test and acceptance test, respectively. All the tests avoid repetitions and are as automating as they can be. In on hand, our unit tests follow the single responsibility principle, there for, each unit test verifies one and only one piece of code. 

Our tests verify, mostly, if the correct display of the text is done correctly and the labels and buttons have the value they should have and if all parameters needed are being displayed by the app.
On the hand hand, our acceptance test puts yourselves in the position of the stakeholders writing the functionality of the app. Our tests verify if the app response as supposed when being tap from the user, making sure the user stories are implemented. Our acceptance test verify if all buttons work well and go to the right menus.

All the test were done with [flutter gherkin](https://pub.dev/packages/flutter_gherkin), being at the folder test_driver.

---

## Configuration and change management

To keep track of the project changes and better manage them we are using [GitHub flow](https://guides.github.com/introduction/flow/). We use it to track issues, set milestones, manage branches and open pull requests.

To bring some automation and create a more natural flow into the project development, we've decided to implement a software building process. This process begins in the need for an issue to be created, whether it is a feature or a bug-fix. When a team member is assigned to it, a branch shall be created, closing the issue when the branch is merged back into master.

---

## Project management

In this project, we opted to use [GitHub Projects](https://github.com/features/project-management) to manage our tasks, goals, and milestones. It is also used to keep track of our "train of thought" regarding mid-development issues, doubts, and general questions. It can be accessed [here](https://github.com/softeng-feup/open-cx-softbeanies/projects).
