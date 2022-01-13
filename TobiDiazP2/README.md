# Project 2

## Project Description

Working in a small team, developers are tasked with creating a consistently-styled Experience Cloud site for a business using both Lightning Aura and Lightning Web Components to display knowledge of and comfortability with both frameworks. All teams are tasked with creating Apex Controllers and Apex Triggers to implement backend logic, as well as writing sufficient test coverage for that Apex code. In addition, the team is required to develop using the Package Based Development Model and make use of proper git/GitHub branching procedures.

## Technologies Used

- Apex
- HTML
- CSS
- JavaScript
- Lightning Web Components
- Aura Components
- Salesforce

## Features

- An LWC that switches between an About Us page to a Student Registration Page
- Custom Salesforce Objects for storing Students and Courses
- A Dashboard that shows the number of Students that have failed and passed courses
- A Trigger that prevents duplicate Students

To do:

- Rendering the Student Registration Page
- Creating a Trigger that prevents a Student from taking a later course without taking the prerequisite courses first
- Creating a Helper Class for Triggers
- Creation of the Sales & Experience Cloud Site

## Getting Started

1. Run this Git Bash command: git clone. 
2. Open the downloaded file in Visual Studio Code.
3. Using the Command Palette (CTRL + SHIFT + P by default) Authorize an Org and Dev Hub.
4. Still using the Command Palette, create a Scratch Org and Push the files to the Org.
5. Once complete, use the Command Palette and Open Default Org.

## Usage

1. Go to the App Manager, and type in "Golden Spoke Driving School"
2. There should be two results. The one with the custom icon is the Custom App that shows the Dashboard, Students, and Products. The other is the LWC that was created.
