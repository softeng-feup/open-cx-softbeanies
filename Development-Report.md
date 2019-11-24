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
  * [Architectural and design decisions]()
  * [Technological architecture]()
  * [Logical architecture]()
* Implementation
  * [Source code]()
  * [Issues](): feature requests, bug fixes, improvements.
* Test
  * [Automated tests](): Functional tests, integration tests, acceptance tests, as much automated as possible.
* Change management
  * [Issues at Github]()
* Project management
  * Tasks management tool 

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

<img src= "https://github.com/softeng-feup/open-cx-softbeanies/blob/34-DomainModel/Diagrams/SimplyFind%20Use%20Case%201.jpeg">

<img src= "https://github.com/softeng-feup/open-cx-softbeanies/blob/34-DomainModel/Diagrams/SimplyFind%20Use%20Case%202.jpeg">

<img src= "https://github.com/softeng-feup/open-cx-softbeanies/blob/34-DomainModel/Diagrams/SimplyFind%20Use%20Case%203.jpeg">

### User stories

+ As a person with no sense of direction, I would like to have very precise directions to not get lost in the building.

+ As a coffee drinker, I would like to know where the coffee machines are, because I don't want to be dependent on the coffee breaks.

+ As a participant, I would want to know where I could do check-in as soon as I arrived, so I wouldn't have to ask.

+ As a FEUP student, I'm interested in knowing where the coffee breaks are, and which speakers will be talking at what time because I already know how to find my way at FEUP.

+ As a forgetful person, I would like to know what conferences are going on today because I want a simple way to get this information.

+ As a speaker, I would like to know the rooms where I am going to give a talk because those are the relevant locations for me.

+ As an user, I would like to know where my colleagues are if i get lost.


### Domain model

<img src= "https://github.com/softeng-feup/open-cx-softbeanies/blob/34-DomainModel/Diagrams/DomainModel.png">


---

## Architecture and Design

The software division of the project follows the **MVC (Model-View-Controller)** architectural pattern. As the name implies this pattern divides the structure of the program in three interconnected parts:

-**Model**: It holds the internal information and is independent of the user interface.

-**View**: Represents the visualization of the data that model contains. 

-**Controller**: Exists between the view and the model. It listens to events triggered by the view and executes the appropriate reaction to these events.

We will focus on three main components of the project where the first two are inserted in the model category and the third in the view category: 
- Data information storage: all the information related to then events and it's location 
-  Route computation and map integration 
-  App design and managment of functionalities in pages

The route computation and the map display is developed with the assistance of the **GoogleMaps API**. This way by giving the correct coordinates of the points of source and destination we can obtain the correct route. After that we need to compute the result and represent it in the map.

The managment of the pages and correspondent functionalities is the section where all the visual components of the pages are implemented. In addiction this section also implies the use of the data storaged as arguments in order to display in the correct places (buttons, bars ,...) and allow to compute the right routes in the section above.


### Logical architecture

The purpose of this subsection is to document the high-level logical structure of the code, using a UML diagram with logical packages, without the worry of allocating to components, processes or machines.

It can be beneficial to present the system both in a horizontal or vertical decomposition:
* horizontal decomposition may define layers and implementation concepts, such as the user interface, business logic and concepts; 
* vertical decomposition can define a hierarchy of subsystems that cover all layers of implementation.

### Physical architecture

The goal of this subsection is to document the high-level physical structure of the software system (machines, connections, software components installed, and their dependencies) using UML deployment diagrams or component diagrams (separate or integrated), showing the physical structure of the system.

It should describe also the technologies considered and justify the selections made. Examples of technologies relevant for openCX are, for example, frameworks for mobile applications (Flutter vs ReactNative vs ...), languages to program with microbit, and communication with things (beacons, sensors, etc.).

### Prototype

To help on validating all the architectural, design and technological decisions made, we usually implement a vertical prototype, a thin vertical slice of the system.

In this subsection please describe in more detail which, and how, user(s) story(ies) were implemented.

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



