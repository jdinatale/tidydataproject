# Variables

### subject

 Subject identifier
###### Data Type:
 Integer

### activity
The activity being performed.
###### Data Type:
 Character
###### Values:
 WALKING
 WALKING_UPSTAIRS
 WALKING_DOWNSTAIRS
 SITTING
 STANDING
 LAYING

###Feature Variables

Each variable has several possible components:
* time or frequency
* body or gravity
* acceleration or gyroscopic
* jerk, magnitude or jerk magnitude
* X, Y or Z axis
* mean or standard deviation

Not all variables contain all components. To keep the length of variable names reasonable, the naming convention of the source data was retained with some modifications. All measurements were normalized to the range -1 to +1 so there are no units. For each subject and activity, the mean was calculated for each variable. The variable names are as follows:
