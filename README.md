## Table of Contents
  * [App Design](#app-design)
    * [Objective](#objective)
    * [Audience](#audience)
    * [Experience](#experience)
  * [Technical](#technical)
    * [Screens](#Screens)
    * [External services](#external-services)
    * [Views, View Controllers, and other Classes](#Views-View-Controllers-and-other-Classes)
  * [MVP Milestones](#mvp-milestones)
    * [Week 1](#week-1)
    * [Week 2](#week-2)
    * [Week 3](#week-3)
    * [Week 4](#week-4)
    * [Week 5](#week-5)
    * [Week 6](#week-6)

---

### App Design

#### Objective
Coddiwomple means to "travel in a purposeful manner towards a vague destination." Coddiwomple is an app for organizing the places around us to make traveling easier.

#### Audience
This app is targeted at anyone who loves to travel.

#### Experience
The casual user will add places to their map and visit a handful of the places they've added.  They will plan trips and check their map to see if they've added anything on the way or at their destination.

The hardcore user will add places all over their map and create lists, trying to visit each place.

[Back to top ^](#)

---

### Technical

#### Screens
* Search screen
* Lists screen


#### External services
* 

#### Views, View Controllers, and other Classes
* Views
  * view places (map and list)
  * add place
  * profile
* View Controllers
  * mapViewController
  * listViewController
  * addPlaceViewController
    * name
    * location (address)
    * select categories
  * profileViewController
  * placeInfoViewController
    * shows name, location on map, and if visited
* Other Classes
  * [list any other classes you will need]

#### Data models
* place
    * name
    * date created
    * visited
    * location (address or GPS coordinates)
    * categories
* category (can be custom or selected via checkboxes)
* list
    * name
    * date created
    * array of places

[Back to top ^](#)

---

### MVP Milestones
[The overall milestones of first usable build, core features, and polish are just suggestions, plan to finish earlier if possible. The last 20% of work tends to take about as much time as the first 80% so do not slack off on your milestones!]

#### Week 1
_planning your app_
* Create design document
* Research appropriate cocoapods and APIs
* Organize flow and structure of app
* Create mockups and general design and aesthetic

#### Week 2
_finishing a usable build_
* Create listViewController
* Create addPlaceViewController

#### Week 3
* Create mapViewController
    * Have places show up on map at correct address or GPS coordinates

#### Week 4
* Create profileViewController

#### Week 5
_starting the polish_
* Implement Firebase login(?)
    * create loginViewController to handle login flow
    * save all data models using Firebase on the user's account
    * if data is present, load data onto map

#### Week 6
_submitting to the App Store_
* Create stable build
* Submit to app store


#### Week 7
_add additional features_
* Import place by searching Google Maps

[Back to top ^](#)
