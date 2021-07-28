#! /bin/bash

#Intro + Win condition
echo "Welcome to Rock-Paper-Scissor game."
read -p "Choose how many won rounds is needed to win the game: " WONROUNDS
echo "You need to win $WONROUNDS rounds to win the game"

: '
General rule:
1-Rock 
2-Paper 
3-Scissors'

#Game counts
GAMECOUNT=0
PLAYERWINS=0
COMPWINS=0
DRAWS=0

#GAME

#Rounds
while [[ $PLAYERWINS < $WONROUNDS && $COMPWINS < $WONROUNDS ]]
	do

#Player pick
		echo "-------------------------------------------------------------"
		read -p "Pick one: 1-Rock, 2-Paper, 3-Scissors. CTRL + C to quit. " PPICK
		case $PPICK in
			[1])
				echo "You picked Rock."
				;;
			[2])
				echo "You picked Paper."
				;;
			[3])
				echo "You picked Scissors."
				;;
		esac					

#Computer pick
		if [[ $PPICK == 1 || $PPICK == 2 || $PPICK == 3 ]]  #Player input check
		then
			CPICK=$(shuf -i 1-3 -n 1) #random number in range 1-3
			case $CPICK in
				[1])
					echo "Computer picked Rock"
					;;
				[2])
					echo "Computer picked Paper"
					;;
				[3])
					echo "Computer picked Scissors"
					;;
			esac				

#Game results

			case $PPICK in
				[1])
					if [ $CPICK == 1 ]
					then
						echo "**It' a draw**"
						((DRAWS++))
					elif [ $CPICK == 2 ] 
					then
						echo "**You lose**"
						((COMPWINS++))
					else
						echo "**You win**"
						((PLAYERWINS++))
					fi	
					;;
				[2])
					if [ $CPICK == 1 ]
					then	
						echo "**You win**"
						((PLAYERWINS++))
					elif [ $CPICK == 2 ]
					then
						echo "**It' a draw**"
						((DRAWS++))
					else	
						echo "**You lose**"
						((COMPWINS++))
					fi	
					;;
				[3])
					if [ $CPICK == 1 ]
					then	
						echo "**You lose**"
						((COMPWINS++))
					elif [ $CPICK == 2 ]
					then
						echo "**You win**"
						((PLAYERWINS++))
					else
						echo "**It' a draw**"
						((DRAWS++))
					fi	
					;;	
			esac
			((GAMECOUNT++))
			
			echo "---Current score---"
			echo "Player wins = $PLAYERWINS"
			echo "Computer wins = $COMPWINS"
			
		else
			echo "You did not pick 1, 2 or 3."
		fi
done

#End of game summary
#Vypíše výsledky v terminálu a uloží je do souboru Gameresults.txt (soubor založí, pokud neexituje)
case $PPICK in
	[123])
		echo "-----------FINAL SCORE-----------" | tee -a Gameresults.txt
		date  | tee -a Gameresults.txt
		echo "Rounds to win: $WONROUNDS" | tee -a Gameresults.txt
		echo "Number of rounds played: $GAMECOUNT" | tee -a Gameresults.txt
		echo "Player wins: $PLAYERWINS" | tee -a Gameresults.txt
		echo "Computer wins: $COMPWINS" | tee -a Gameresults.txt
		echo "Draw games: $DRAWS" | tee -a Gameresults.txt
		if [ $PLAYERWINS -gt $COMPWINS ]
		then 
			echo "YOU WON, CONGRATULATION!" | tee -a Gameresults.txt
		elif [ $PLAYERWINS -eq $COMPWINS ]
		then 
			echo "IT'S A DRAW." | tee -a Gameresults.txt
		else
			echo "YOU LOST, BETTER LUCK NEXT TIME." | tee -a Gameresults.txt
		fi
		;;
esac



