####Problem 1####

##Load data

data <- read.csv("UWvMSU_1-22-13.txt", sep = "\t", header=TRUE, stringsAsFactors = FALSE)

##Set initial totals, vectors, and first vector values for UW, MSU, and time

UWrunningsum <- 0             #Starting value for the total score of UW
MSUrunningsum <- 0            #Starting value for the total score of MSU
UWtotals <- c()               #Set vector for all UW total scores at each time
UWtotals[1] <- UWrunningsum   #Set first value of the vector to the starting UW score of 0
MSUtotals <- c()              #Set vector for all MSU total scores at each time
MSUtotals[1] <- MSUrunningsum #Set first value of the vector to the starting MSU score of 0
time <- c()                   #Set vector for all time values
time[1] <- 0                  #Set first value of the vector to the starting time of 0

##for loop

for(i in 1:nrow(data)){ #Loop through each row of the data file
  if (data$team[i]=="UW") { #See if the "team" column is UW
    UWrunningsum <- UWrunningsum + data$score[i] #If it is UW, add the data's ith row value in the score column to UWrunningsum to update UWrunningsum    
    UWtotals[i] <- UWrunningsum #Set the ith value of the UWtotals vector to the new total value of UW's score (UWrunningsum)
    MSUtotals[i] <- MSUrunningsum #Keep the ith value in the MSUtotals vector the same as the previous value in this vector
    time[i] <- data$time[i] #Set the ith value of the time vector equal to the data's ith row value in the score column
    
  }else{ #The only other possibility in the 'team' column is MSU, so we only need the 'else' 
    MSUrunningsum <- MSUrunningsum + data$score[i] #If it is MSU, add the data's ith row value in the score column to UWsum to update MSUrunningsum 
    MSUtotals[i] <- MSUrunningsum  #Set the ith value of the MSUtotals vector to the new total value of MSU's score (MSUrunningsum)
    UWtotals[i] <- UWrunningsum  #Keep the ith value in the UWtotals vector the same as the previous value in this vector
    time[i] <- data$time[i]  #Set the ith value of the time vector equal to the data's ith row value in the score column
  }
}

##Plot both lines
plot(time, UWtotals, xlab="Time", ylab="Total Score", type='l') #Plot time vector values on x-axis and corresponding UW sums (UWtotals vector) on y-axis
lines(time, MSUtotals)          #On the same graph, plot time vector values on x-axis and corresponding MSU sums (MSUtotals vector) on y-axis



####Problem 2####

###Solution Option 1 for Problem 2

##Initial game phrase
print("I'm thinking of a number 1-100...")  #Print the starting game phrase

##Set up values to be compared
possiblevalues <- c(1:100)  #Generate vector of possible whole numbers that can be chosen ranging from 1 to 100
number <- sample(possiblevalues, 1, replace=FALSE, prob=NULL) #Choose one of the numbers in the "possiblevalues" vector at random to use as the number users will try to guess
guess <- readline(prompt="Guess: ") #Prompt users for their number guess and gets their input
maxguess <- 100 #Number of maximum guesses for the user 
                #This maxguess value can be altered as desired

##for loop
for (i in 1:maxguess){ #Start for loop. Users get as many opportunities to guess correctly as the maxguess value
  if (guess < number) { #See if the user's guess is lower than the random number
    print("Higher") #Tell users that the random number is higher then their guess
    guess <- readline(prompt="Guess: ") #Prompt users for new guess
    
  }else if (guess > number){ #See if the user's guess is lower than the random number
    print("Lower") #Tell users that the random number is lower then their guess
    guess <- readline(prompt="Guess: ") #Prompt users for new guess
  }else { #See if the user's guess is equal to the random number; only need an "else" for this because there are no other possibilities at this point in the for loop
    print("Correct!") #Tell users that their guess is correct
    break              #Exit loop to prevent any excess guessing opportunities available from the vector "maxguess" 
    
  }
}

####Solution Option 2 for Problem 2

##Initial game phrase
print("I'm thinking of a number 1-100...")  #Print the starting game phrase

##Set up values to be compared
possiblevalues <- c(1:100) #Generate vector of possible whole numbers that can be chosen ranging from 1 to 100
number <- sample(possiblevalues, 1, replace=FALSE, prob=NULL) #Choose one of the numbers in the possiblevaues vector at random to use as the number users will try to guess
guess <- readline(prompt="Guess: ") #Prompt users for their number guess and gets their input


##while loop
while (guess != number){ #Loop through this loop while the user's guess is not equal to the randomly generated number
  if (guess < number) { #See if the user's guess is lower than the random number
    print("Higher") #Tell users that the random number is higher then their guess
    guess <- readline(prompt="Guess: ") #Prompt users for new guess
    
  }else if (guess > number){ #See if the user's guess is lower than the random number
    print("Lower") #Tell users that the random number is lower then their guess
    guess <- readline(prompt="Guess: ") #Prompt users for new guess
  }
}

##Tell user they are correct
print("Correct!")  #Tell users that their guess is correct


