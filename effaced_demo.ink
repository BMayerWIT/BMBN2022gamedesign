VAR workerOpinion = 40
VAR oldWorkerOpinion = 0
VAR patientPacifistOpinion = 50
VAR patientRevolutionaryOpinion = 50
VAR guardOpinion = 20
VAR investigate = 0
VAR machineRepeat = false






Dr. Rowsell: Cassandra, we're ready for you.
Cassie looks up at a bearded man in a white lab coat standing in a doorway next to her. After a moment, he takes a key from his pocket as he bends down to unlock the handcuffs confining her to the waiting room chair.

+ [Go inside] -> go_inside_test_room
+ [Stay put] -> stay_in_waiting_room

=== go_inside_test_room ===
Cassie gives Dr. Rowsell a nervous look, before standing up out of her chair in the waiting room and following him inside.
-> test_room.enter

=== stay_in_waiting_room ===
Cassie: I'm not going in there again.
Dr. Rowsell: Oh, come on, Cassandra, it will only take a minute. We're waiting for you in there.

+ [Go inside] -> go_inside_test_room
+ [Stay put] -> stay_in_waiting_room_2

=== stay_in_waiting_room_2 ===
Cassie: No! I won't do it!
Dr. Rowsell: Cassandra...
The doctor squats down to Cassie and puts his hand on her forearm.
Dr. Rowsell: You know what will happen if you refuse to go in, don't you?
Cassie looks the doctor in the eye and exhales shakily.
Dr. Rowsell: Now... will you please come with me?
His words are compassionate, yet he speaks them with a threatening aura.

+ [Go inside] -> go_inside_test_room
+ [Stay put] -> stay_in_waiting_room_3

=== stay_in_waiting_room_3 ===
Cassie shakes her head, a tear running down her cheek.
Dr. Rowsell: Well, don't say I didn't warn you, Cassandra.
Rowsell grips Cassie's arm and begins dragging her into the testing room.

+ [Resist] -> resist.chase
+ [Let it happen] -> let_it_happen

=== let_it_happen ===
Cassie yelps as the doctor pulls her from her chair. He drags her over to the door, pushes her in, and steps inside, closing the door behind him.
-> test_room.enter






=== resist ===
= chase
Cassie yelps as the doctor pulls her from her chair. In a panic, she grabs a pen from Rowsell's pocket, clicks it out, and brings it down on his forearm.
Cassie: Get the fuck away from me!
Rowsell yells in pain as he lets go of Cassie. Cassie takes a step back and sees blood drip from Rowsell's wound. Without taking another moment to think, she turns around and sprints down the corridor.
Dr. Rowsell: Somebody catch that bitch! Security! Anybody!
Cassie risks a glance behind her, and catches a glimpse of two guards running into the corridor. She returns her focus to the hallway ahead of her and notices that it splits off to the left and to the right.

+ [Continue forward] -> resist.forward
+ [Turn left] -> resist.left
+ [Turn right] -> resist.forward



= forward 
Cassie keeps running straight ahead, hoping to outrun the guards. However, when she takes another quick glance behind her, she notices them gaining on her. She looks around for something to impede them, but is soon greeted by another two guards ahead of her. Cornered, Cassie comes to a halt.
Guard: Nowhere to run now, girlie.
The guards ahead of her pull out batons and approach her. Upon reaching Cassie, one of them strikes her in the leg with their baton. As she falls to the ground, the other guard grabs her wrist and forces her hands behind her back. Bringing her back to her feet, the guards then escort Cassie back to the testing room.
-> test_room.enter



= left
Cassie decides to take a left turn, hoping to lose the guards. However, when she takes another quick glance behind her, she notices them gaining on her. She looks around for something to impede them, or for some means to escape. She notices an unattended medicine cart in the hallway and spots an empty room through a door window.

+ [Medicine cart] -> resist.medicine_cart
+ [Empty room] -> resist.empty_room

= medicine_cart
Cassie runs over to the medicine cart in the middle of the hallway and as she passes it by, overturns it, leaving it strewn across the floor, and spilling dozens of bottles of medicine everywhere. She keeps running, and glances behind her to see that one of the guards has fallen due to her obstruction, and the other has stopped beside him. Eventually, she finds the wing's rec room, swings the door open, and walks inside.
DIVERSION ENDING
->END

= empty_room
Cassie runs over to the door, and attempts to open it. Locked. She tries to force the door open, but it still doesn't give. She then hits the door window with her elbow in an attempt to break it, but it also doesn't give. Soon enough, the two guards chasing her catch up and pull out batons.
Guard: Nowhere to run now, girlie.
Upon reaching Cassie, one of them strikes her in the leg with their baton. As she falls to the ground, the other guard grabs her wrist and forces her hands behind her back. Bringing her back to her feet, the guards then escort Cassie back to the testing room.
-> test_room.enter



= right
Cassie decides to take a right turn, hoping to lose the guards. She notices a door open slightly ajar and takes the opportunity. She rushes in, locking the door behind her, and slinks to the floor beside it. Outside she hears the footsteps of the guards.
Guard: Where'd she go?
One of the guards approaches the door of the room Cassie is in. Silence. Then suddenly, the doorknob shakes as the guard tries to open it. Cassie inhales sharply, but then holds her breath so as to not alert the guards.
Guard: Locked. Must've gone somewhere else.
Cassie put her ear to the door, and heard nothing but footsteps receding.
ESCAPE ENDING
-> END






=== test_room ===
= enter
~ oldWorkerOpinion = workerOpinion
{stay_in_waiting_room_3:
    Opinions Affected
    {resist:
        ~workerOpinion = workerOpinion - 20
        ~guardOpinion = guardOpinion - 10
        Worker Opinion (-20): {workerOpinion}
        Guard Opinion (-10): {guardOpinion}
    }
    {not resist:
        ~workerOpinion = workerOpinion - 10
        Worker Opinion (-10): {workerOpinion}
    }
}


{resist:
    As Cassie is thrown in the room, she catches a glimpse of someone else inside. She stands up to see a woman sitting in a chair looking at some papers.
    Dr. Sullivan: Cassandra... How nice of you to finally meet us... Please take a seat.
}
{let_it_happen:
    As Cassie is thrown in the room, she catches a glimpse of someone else inside. She stands up to see a woman sitting in a chair looking at some papers.
    Dr. Sullivan: Ah, Cassandra. Take a seat, let's get started, shall we?
}
{not resist and not let_it_happen:
    As Cassie walks in the room, she notices a woman sitting in a chair looking at some papers.
    Dr. Sullivan: Ah, Cassandra. Take a seat, let's get started, shall we?
}
Cassie walks shyly towards a foldable chair across the table from the new doctor. Rowsell takes a seat next to Sullivan. As Cassie sits down, Sullivan begins questioning her.
Dr. Sullivan: So Cassandra, how has your time been here since your last check-up with Dr. Rowsell?
-> test_room.questions



= questions
+ [Answer positively] -> test_room.positive
+ [Answer negatively] -> test_room.negative
* [Reply coldly] -> test_room.cold
* [Say nothing] -> test_room.say_nothing
* {say_nothing} [Say nothing] -> test_room.say_nothing2



= positive
Cassie takes a moment, and decides that she should tell the doctors what they want to hear.
Cassie: I've been doing pretty well. I've been talking with a few of the other inmates here and-
Dr. Rowsell: Patients, Cassandra. Not inmates. We've been over this.
Dr. Sullivan: Calm down, Rowsell. Let the girl talk, for God's sake. Continue, {cold: Cassie}{not cold: Cassandra}.
Cassie is taken aback, but returns to her answer.
Cassie: I've been getting along with the other... <i>patients</i>. I think things are getting better.
Dr. Sullivan: That's great to hear, {cold: Cassie}{not cold: Cassandra}. Alright then, next question. How do you feel the tests are-
~ workerOpinion += 5
-> test_room.call_out



= negative
Cassie: Shit.
Dr. Sullivan: And why would that be?
Cassie: Because this place is a prison! We're told when to sleep, when to eat, what to do, and don't even get me started on the tests! They're-
Dr. Rowsell: Okay, that's quite enough out of you, Cassandra.
Dr. Sullivan: Calm down, Rowsell. Let the girl talk, for God's sake. Continue, {cold: Cassie}{not cold: Cassandra}.
Cassie is taken aback, but returns to her answer.
Cassie: The tests... They violate us, try to make us feel certain ways about things... No one wants this!
Rowsell leans in, fingers interlocked and arms on the table, upon hearing this.
Dr. Rowsell: "Us"? Have you been talking to the other patients about your examinations? You understand that it defeats their purpose, don't you? Now, who did you talk to?

+ [Snitch] -> test_room.snitch
+ [Say nothing] -> test_room.dont_snitch

= snitch
Cassie pauses for a moment, weighing her choices, before deciding to snitch on her fellow patients.
Cassie: It was number 97. I heard him talking about one of his tests. It sounded similar to my own so when we were alone I asked him about it. He hates them too.
Dr. Sullivan: Thank you for your honesty, but it was rather unnecessary to divulge that much information. We do monitor patients' activity. Had it been a problem, we would have picked up on it already, Dr. Rowsell. Anyways, next question. How do you feel the tests are-
~ patientRevolutionaryOpinion -= 5
~ patientPacifistOpinion -= 5
-> test_room.call_out

= dont_snitch
Cassie decides that it's better that she shuts up and says nothing so as to not endanger herself or her fellow patients.
After a short pause, Sullivan breaks the silence.
Dr. Sullivan: I'm sure that will be quite alright, {cold: Cassie}{not cold: Cassandra}. We do monitor all our patients' activities. We'll just get someone to review yours and find out for ourselves. Anyways, next question. How do you feel the tests are-
~ workerOpinion -= 10
-> test_room.call_out



= cold
Cassie: Cassie.
Dr. Sullivan: Excuse me?
Cassie: My name is Cassie. Not Cassandra.
The doctors seem lost for words, before Sullivan rephrases.
Dr. Sullivan: Alright then... <i>Cassie</i>, how has your time here been since your last check-up?
~ workerOpinion -= 5
-> test_room.questions



= say_nothing
Cassie refuses to answer the doctors. Sullivan lets out an exasperated sigh.
Dr. Sullivan: {cold: Cassie}{not cold: Cassandra}, if you don't talk to us, this treatment isn't going to go any faster.
-> test_room.questions

= say_nothing2
Cassie still refuses to answer.
Dr. Sullivan: Okay. I see where this is going. Next question. How do you feel the tests are-
~ workerOpinion -= 5
-> test_room.call_out



= call_out
{positive or negative or cold or say_nothing2:
    {not ((positive and say_nothing2 and not dont_snitch and not cold) or (positive and cold and not say_nothing2 and not dont_snitch)):
        Opinions Affected
        {positive or dont_snitch or cold or say_nothing2:
            Worker Opinion ({workerOpinion - oldWorkerOpinion}): {workerOpinion}
        }
        {snitch:
            Pacifist Patient Opinion (-5): {patientPacifistOpinion}
            Revolutionary Patient Opinion (-5): {patientRevolutionaryOpinion}
        }
    }
}
+ [Continue]

Just then, what seems to be a lab assistant barges in the room.
Lab Assistant: Dr. Sullivan, Dr. Rowsell, you're needed in the east wing. Now.
There was a tinge of panic in her voice.
Dr. Sullivan: We'll be right over. {cold: Cassie}{not cold: Cassandra}, wait here, and we shall be back momentarily.
And with that, the pair stood up and left, leaving the majority of their belongings in the rush.
-> test_room.explore

= explore
{investigate == 5:
    -> test_room.doctor_return
}
{Cassie looks around the room and, noticing it free to explore, takes a few things into account. The pair of doctors had left a bunch of their notes on the table, there were a couple of points of interest throughout the room, and the door had seemingly been left unlocked.| }

* [Investigate notes] -> test_room.notes
+ {(not (wrench and lockpick)) and (not tracker)}[Investigate room] -> test_room.room
+ [Investiagte door] -> test_room.door
* [Do nothing] -> test_room.wait



= notes
Cassie decides to look through Sullivan's and Rowsell's notes that were left on the table in front of her. Cassie stands up and makes her way over to the pile of sheets and flicks through them until she sees her patient number. 63: Cassandra Williams. As she reads through the page, nothing seems out of the ordinary. That is, until she notices a section called 'Tracking' filled out. However, she cannot read it as everything seems to be written in some form of code. The only thing she is able to make out are the words 'WRIST R' She decides to fold up the sheet and take it with her.
~ investigate++
-> test_room.explore

= room
{investigate == 5:
    -> test_room.doctor_return
}
{Cassie notices a drawer slightly open ajar and a mysterious machine in the room with her.|}
+ {not (wrench and lockpick)} [Investigate drawer] -> test_room.drawer
+ {not tracker} [Investigate mysterious machine] -> test_room.machine
+ [Do something else] -> test_room.explore

= drawer
Cassie decides to rifle through the open drawer in the corner of the room{. Inside the drawer lies a large collection of tools. Most of the tools seem foreign to her, but she spots a wrench and what looks like a lockpicking tool.| again.}
~ investigate++
* [Take wrench] -> test_room.wrench
* [Take lockpicking tool] -> test_room.lockpick
* [Don't take anything] -> test_room.room

= wrench
-> test_room.room

= lockpick
-> test_room.room

= machine
~investigate++
{machine < 2: Cassie decides to take a closer look at the machine. {not notes: She takes a while to inspect it, but can't seem to figure out what it's used for. She does however notice that a gear is loose when she goes to turn it on.} {wrench and not notes: She notices that she could fix it, but as she doesn't know what the machine does, she decides against it. Maybe it's broken for a reason?}}
{notes and not machineRepeat: 
At first glance, she can't figure out what the machine is used for, but notices a code written on the side of it. She takes her notes back out and notices that it matches something written in the 'Tracking' section. With this information and the 'WRIST R', she figures out that the machine must implant tracking devices into patients. Maybe it can take them out? She goes to turn it on, but notices that a gear is loose, rendering it unusable.
~ machineRepeat = true
}
{machine > 1: {not notes: Cassie approaches the machine again, but still does not understand it.} {notes and not wrench: Cassie approaches the tracking machine again, but still doesn't have anything to fix the gear.}}
{notes and wrench: 
Cassie pulls out the wrench she found in the drawer and uses it to fasten the gear in place. With that, the machine turns on. Guessing what each of the controls do, she flicks a switch from 'IN' to 'OUT', and places her wrist in a strap underneath a sort of magnet. She hits a big red button, and immediately feels a searing pain in her wrist as the magent pulls the tracking device out of her. After a few seconds, the tiny tracking device tears its way out of her skin and creates a small "DING!" as it hits the magnet above. Cassie decides to take the tracker with her so as to not arouse any suspiscion.
-> test_room.tracker
}
-> test_room.room

= tracker
-> test_room.room

= door
~investigate++
{door < 2: Cassie decides to try and leave the room. However, upon reaching the door and trying its handle, she discovers that it is locked. Upon closer investigation, she concludes that it must only open from the outside.}
{door > 1 and not lockpick: Cassie decides to try the door again, but it is still locked.}
{door > 1 and lockpick:  Cassie approaches the door again.}{lockpick: She decides to try using the lockpicking tool she found in the drawer to open it. After a few minutes of fiddling with the lock, she manages to pop it open. She takes a hesitant look out into the hall to check for guards, and upon finding none, scurries away.}
{lockpick: 
{tracker: PERFECT }BREAKOUT ENDING
-> END
}
-> test_room.explore

= wait
Cassie decides it best to wait around until the doctors get back in fear of something happening to her in the event of her being caught. {negative: She <i>is</i> being constantly monitored, after all.}
{positive: 
"PATIENT" ENDING
- else:
PATIENT ENDING
}
-> END

= doctor_return
Just then, the door opens, and Rowsell and Sullivan walk back in. 
{not notes and not tracker and not (wrench or lockpick): 
    Dr. Sullivan: I trust you didn't try anything while we were gone, {cold: Cassie}{not cold: Cassandra}?
    Cassie: O-Of course not...
    Dr. Sullivan: Excellent. Now... where were we?
    HELPLESS ENDING
    -> END
}
{not notes and not tracker and (wrench or lockpick):
    Dr. Sullivan: I trust you didn't try anything while we were gone, {cold: Cassie}{not cold: Cassandra}?
    Cassie: O-Of course not...
    Sullivan then walks over to the drawer where Cassie got the {wrench: wrench } {wrench and lockpick:and} {lockpick: lockpicking tool }from. She grunts.
    Dr. Sullivan: Rowsell.
    Rowsell then approaches Cassie and violently searches her pockets until he finds the tool{wrench and lockpick:s}.
    Dr. Sullivan: Well, well, well... Seems like you're trying to hide something from us. Nothing a little testing won't fix, I'm sure. Doctor, take her away. I think this little check-up has given us enough information. You aren't ready, Cassandra.
    CAUGHT ENDING
    -> END
}
{notes and not tracker:
    Dr. Sullivan: I trust you didn't try anything while we were gone, {cold: Cassie}{not cold: Cassandra}?
    Cassie: O-Of course not...
    Sullivan walks over to the table where she had been previously sitting.
    Dr. Sullivan: Then why does it look like somebody has tampered with my notes?
    Cassie: I-I just...
    Dr. Sullivan: You just what? You just went through my notes to find classified information? I thought you would have wanted to get out of this place as soon as possible, but apparently you want to stay here and go through even more tests. Rowsell. Take her away. I think this little check-up has given us enough information. You aren't ready to leave, Cassandra.
    CAUGHT ENDING
    -> END
}
{tracker:
    Dr. Sullivan: I trust you didn't try anything while we were gone, {cold: Cassie}{not cold: Cassandra}?
    Cassie: O-Of course not...
    Sullivan walks over to the table where she had been previously sitting, but quickly notices Cassie clutching her wrist.
    Dr. Sullivan: Is something wrong with your arm, {cold: Cassie}{not cold: Cassandra}?
    Cassie: What? No, it's fine. Why?
    Dr. Sullivan: Then why are you holding it so tightly? Rowsell, check her arm.
    Rowsell approaches Cassie and violently grabs her arm, revealing a small cut where the tracker was taken out of her wrist. Sullivan lets out a long exasperated sigh.
    Dr. Sullivan: I had hopes, Cassandra. Hopes that you'd be one of the good ones. Nothing some testing won't fix, I'm sure. Doctor, take her away. I think this little check-up has given us enough information. You are not ready to leave, Cassandra.
    CAUGHT ENDING
    -> END
}
IF I CODED THIS RIGHT YOU SHOULD NEVER SEE THIS ENDING ENDING
-> END