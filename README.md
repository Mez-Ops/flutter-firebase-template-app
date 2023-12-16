# flutter_firebase_template_app

This is a template app for Mez Ops Flutter app development. 

This particular template app is a tennis scheduling app. 

A simple Tennis scheduling app

## Features

The end user will be able to:
    - Find a match for opponents based on the tennis rating
    - Schedule matches with other players
    - Record the results of the match (who won the match)
    - Track the user's matches and results. 
    - Basic authentication via phone number auth in Firebase


## Architecture

Note: All source files will be under the /lib folder with no subfolders.

Backend:
    - Firebase Auth: to authenticate users
    - Firebase Firestore: to store user and match data
Front end:
    - Screens:
        - LoginScreen: the initial screen assuming user is not authed. User will simply enter in phone number and hit login. They will then enter the OTP code and be authed. 
        - UserScreen: The user's personal results screen. 
            - If tennis rating is missing, ask user to enter
            - User can hit the floating action button to schedule a match
            - Contains match requests that the user can accept
        - ScheduleScreen: The screen where the user will schedule a match. 
            - Simple list view sorted by players with similar tennis ratings. 
Data models:
    - User:
        - id (string): Firebase uid of document
        - name (string): Name of user
        - tennisRating (double): Rating of user
    - Tennis match: Represent a tennis match between two players
        - id (string): Firebase uid of document
        - players (List[string]): the id's of the two players
        - matchTime (Datetime): datetime of the match
        - winner (string): id of the winner (default to Null)
State management:
    - Provider for ephemeral state
    - Stateful widgets for internal widget state
Testing:
    - Unit tests for all dart files under /lib folder
    - Integration tests using local Firebase emulator

## Helpful links

- Tennis ratings: https://www.usta.com/en/home/coach-organize/tennis-tool-center/run-usta-programs/national/understanding-ntrp-ratings.html