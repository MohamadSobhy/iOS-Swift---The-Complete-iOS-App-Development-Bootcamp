import UIKit

func loveCalculator() {
    let loveScore = Int.random(in: 0...100)
    
    if(loveScore > 80) {
        print("You love each other like Kanye loves Kanye")
    } else if(loveScore > 40) {
        print("You go together like Coke and Mentos")
    } else {
        print("You will be forever alone")
    }
}


loveCalculator()

