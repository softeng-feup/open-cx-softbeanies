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
  * [Architectural and design decisions](#Architectural and design decisions)
  * [Logical architecture](#Logical architecture)
  * [Physical architecture](#Physical architecture)
  * [Prototype](#Prototype)
* Implementation
* Test
* [Change management](##Change management)
* [Project management](##Project management)

So far, contributions are exclusively made by the initial team, but we hope to open them to the community, in all areas and topics: requirements, technologies, development, experimentation, testing, etc.

Please contact us! 

Thank you!

*Ana Margarida Ruivo Loureiro,</br>
Gonçalo José Marantes Pimenta da Costa Monteiro,</br>
João Miguel Ribeiro de Castro Silva Martins,</br>
Maria Helena Viegas Oliveira Ferreira*

---
## Product Vision
Our vision is to help users navigate the conference building by guiding them from their current location to relevant spots in the conference

---
## Elevator Pitch
We started this project because we understand how hard it is to find our way in a conference building we have never been in. So why would you find your way when *SimplyFind* can do it for you? If you need to go somewhere and have no idea how to, just a couple of taps will make sure you go where you need to without ever getting you lost.

---
## Requirements
### Use case diagram 

<img src= "https://github.com/softeng-feup/open-cx-softbeanies/blob/master/Diagrams/SimplyFind%20Use%20Case%201.jpeg">

<img src= "https://github.com/softeng-feup/open-cx-softbeanies/blob/master/Diagrams/SimplyFind%20Use%20Case%202.jpeg">

<img src= "https://github.com/softeng-feup/open-cx-softbeanies/blob/master/Diagrams/SimplyFind%20Use%20Case%203.jpeg">

### User stories

+ As a person with no sense of direction, I would like to have very precise directions to not get lost in the building.

+ As a coffee drinker, I would like to know where the coffee machines are, because I don't want to be dependent on the coffee breaks.

+ As a participant, I would want to know where I could do check-in as soon as I arrived, so I wouldn't have to ask.

+ As a participant, I would like to know more details about the events occurring in the conference. 

+ As a FEUP student, I'm interested in knowing where the coffee breaks are, and which speakers will be talking at what time because I already know how to find my way at FEUP.

+ As a forgetful person, I would like to know what conferences are going on today because I want a simple way to get this information.

+ As a speaker, I would like to know the rooms where I am going to give a talk because those are the relevant locations for me.

+ As an user, I would like to know where my colleagues are if i get lost.


### Domain model

<img src= "https://github.com/softeng-feup/open-cx-softbeanies/blob/45-MVCrefactor/Diagrams/DomainModel.png">


---

## Architecture and Design

#Architectural and design decisions

The software division of the project follows the **MVC (Model-View-Controller)** architectural pattern. As the name implies this pattern divides the structure of the program in three interconnected parts:

-**Model**: It holds the internal information and is independent of the user interface.

-**View**: Represents the visualization of the data that model contains. 

-**Controller**: Exists between the Model and View working as intermediate of information.

Our project is centered in the implementation of three main parts:

	- Storage of the data;
	
	- Route computation with map integration;
	
	- App design and functionalities;


The information from the server needs to be processed and organized into classes present in the package - Model-POI. 
Those classes allows us to represent the events in the conference and the points of interest associated with them. Furthermore we implemented a graph with connections that allows to represent the paths from point to point. This way we are able to represent the paths available in the building.

Like previously said the graph representation enables us to represent all the paths possible in the building. Hence we can use this representation to compute the routes desired by implementing a simple Dijkstra method. In the end we have a list of connected points of interest from the origin to the destination point to represent in the map. 

The app design is the related to the GUI interface of the application. This includes the associated visual components of the pages and the correct handle of the information requested to present there and also the the respective implementation of all the functionalities associated with the GUI.
In addiction the map and the display of the routes is developed with the assistance of the **GoogleMapsAPI**.

### Logical architecture

Like we said above the architecture pattern followed in this project was the MVC Model. 
To accomplish this we divided the project in three logical components/packages - **Controller**, **Model-POI** and **Views**. 

The **View** is divided into pages and widgets used namely the GoogleMapsWidget and this component's main functionality is to represent the information stored in model component.

The **Model** stores all the information into a logical structure supported by related funtions.

The **Controller** processes actions triggered by the view to update the model. (ex: by clicking in a button to display a route the user starts a chain of requests where the view communicates to the controller the request; the controller collects the information needed and calculates in the model the route to be the displayed by the view);

<img src= "https://github.com/softeng-feup/open-cx-softbeanies/blob/45-MVCrefactor/Diagrams/ComponentDiagram.png">

### Physical architecture

In this project we designed an application for mobile that uses the GPS system to locate the user and find the direction to the different points of interest of the conference kept in a database.

The main components of the physical architecture are the mobile devices, the database and the GPS system.

The technologies used in the project had a lot of research before we came with the final decisions. Initially we thought to use microbits with Bluetooth to locate the users but we ended up using GPS intead. 
The framework choosen was Flutter (that uses Dart) in deteriment to ReactNative since after a time of reflection and investigation we came to the conclusion that flutter was more intuitive and a better technology for the development of mobile apps for less experienced people.

<img src= "https://github.com/softeng-feup/open-cx-softbeanies/blob/45-MVCrefactor/Diagrams/DeploymentDiagram.png">

### Prototype

Our application allows an user to choose between two diferent approaches of navigation.

In the first option we can choose a point of interest by exploring a menu organized by different categories: lectures, workshops, checkin , food, wc and exits. Here we can select a specific lecture or workshop and look at a detailed explanation about the event before deciding whether we want to compute the path to it. In addiction all the remaining categories that have more than one point of interest associated - bathrooms, food machines and exists - will display all the points in the map so we can choose to which point we want to go and calculate the route.

In the second option we can introduce with the keyboard the origin and destination in the search bar to compute the path.

This means that we concluded almost every user story we planed to do. Unfortunately we had to choose to leave the ability to connect users with each other and diferenciate different types of users (speaker, attendee).

However all the other user stories were concluded with sucess: 

+ As a person with no sense of direction, I would like to have very precise directions to not get lost in the building - both options of in our application culminate with the abiliy to show the user the correct direction to a point of interest.

+ As a coffee drinker, I would like to know where the coffee machines are, because I don't want to be dependent on the coffee breaks - We incorporated food machines into our database as a point of interest so with a quick search the user will be able to know where he can buy a coffee.

+ As a participant, I would want to know where I could do check-in as soon as I arrived, so I wouldn't have to ask - similar to the coffe machines we incorporated the checkin into our database;

+ As a FEUP student, I'm interested in knowing where the coffee breaks are, and which speakers will be talking at what time because I already know how to find my way at FEUP - the coffee breaks were added to the database; the speakers can be consulted in the menu Explore in the option "Lectures" where we can see all the available lectures at the time and the respective speakers.

+ As a forgetful person, I would like to know what lectures are going on today because I want a simple way to get this information - by navigating in the  menu explore and choosing "Lectures" we can consukt all the available lectures for the day. Furthermore we can select each lecture for a more detailed description.

---

## Implementation

Regular product increments are a good practice of product management. 

While not necessary, sometimes it might be useful to explain a few aspects of the code that have the greatest potential to confuse software engineers about how it works. Since the code should speak by itself, try to keep this section as short and simple as possible.

Use cross-links to the code repository and only embed real fragments of code when strictly needed, since they tend to become outdated very soon.

---

## Test

There are several ways of documenting testing activities, and quality assurance in general, being the most common: a strategy, a plan, test case specifications, and test checklists.

In this section it is only expected to include the following:
* test plan describing the list of features to be tested and the testing methods and tools;
* test case specifications to verify the functionalities, using unit tests and acceptance tests.
 
A good practice is to simplify this, avoiding repetitions, and automating the testing actions as much as possible.

---

## Configuration and change management

In order to keep track of the project changes and better manage them we are using [GitHub flow](https://guides.github.com/introduction/flow/). We use it to track issues, set milestones, manage branches and open pull requests.

In order to bring some automation and create a more natural flow into the project development, we've decided to implement a software building process. This process begins in the need for a issue to be created, whether is a feature or a bug-fix. When a team member is assigned to it, a branch shall be created, closing the issue when the branch is merged back into master.

---

## Project management

In this project we opted to use [GitHub Projects](https://github.com/features/project-management) to manage our tasks, goals and milestones. It is also use to keep track of our "train of thought" regarding mid-development issues, doubts and general questions. It can be accessed [here](https://github.com/softeng-feup/open-cx-softbeanies/projects).



