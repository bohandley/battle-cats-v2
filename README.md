# Battle Cats

### Battle Cat Developers:

* Brendan O'Handley - Team Lead - @bohandley 
* Saham Khozestani - @sahamak
* Dominique Goncalves - @dgonca
* Matthew Mayerle - @mwmayerle
 
Battle Cats is an interactive app for pet lovers who want to show off their pets and battle the cutest pets in their spare time. Users can vote on the cuteness of other pets and earn trophies over time as they win battles.
 
##Installation

To run the code on your local machine, Ruby, Rails, and the ImageMagick gem are required. 

* Download, install, and verify that Ruby v2.2.2 or greater is installed. 
 

 `$  brew install ruby`

 Check Ruby Version

 `$ ruby -v`
 
 

* Download and install Rails v5.0 

 `$ gem install rails`
 
* Download imagemagick gem. 
 
 ` $ brew install imagemagick `
  
* Clone the BattleCats repository to your local machine, navigate into its directory, 
 
  ` $ git clone ` 
 
* Run 'bundle install'. 
 
  ` $ bundle install `
  
* Setup your database with the rails commands
  
  ` $ rails db:create`

   `$ rails db:migrate `
  
* Start a local server using the 'rails server' command
 
  ` $ rails server `
   
* Navigate to 'localhost:3000'.
 
 The app can be accessed online at 'https://battle-cats-chicago.herokuapp.com/' or by clicking [here](https://battle-cats-chicago.herokuapp.com/).
 
## Instructions

### General Use

 Logged in users can browse a list of pets accessed from the "All Pets" link found in the footer. Users can grant a cuteness point to any pet they feel is cute from that pet's profile page or choose to battle that pet. Battling and cuteness points for each pet is accessed by clicking on the desired pet in the pet index. To create a larger sense of community, cuteness points may only increase. A user can only battle or grant cuteness points to the pets of other users. The 'User Profile' page displays all of the pets a user has created, completed battles, and battles in progress.
 
 
### Registration and Authentication:

 To access BattleCats, first navigate to the registration page and register as a new user if you are not registered. Registration is required to play BattleCats. If you are already a registered user, the login form can be found in the footer under "Log In".
 
 
### Creating and Editing Your Pets:

 To create a pet, click on the "Create a New Pet" button found on the User Profile page. Fill out the relevant information about your pet, and then click the "Create a New Pet" button. The zipcode and bio fields are optional, only a name is required. If you choose not to upload an image, a default image will be used instead. Once your pet has been added, you can edit that pet's details from the 'User Profile' page or remove its details from database with the delete link found next to your pet's name.
 
 
### Battling a Pet:

 To a battle a pet, select the pet you would like to battle from the Pet Index by clicking on that pet. Then click the "Battle!" button. From their, select from your pets the pet you would like to do battle with and click the "Battle!" button. From there, click on the 'Start' button and then rapidly tap the button until time has elapsed. This will generate your score, which will be compared against the score of the pet you've chosen to battle against. Once the battle is complete, the final score can be viewed on the user profile page.
