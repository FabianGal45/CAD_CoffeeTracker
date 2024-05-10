# Coffee Tracking App

As part of this CA I have decided to build a easy to use coffee purchases management application. This application aims to be a personal web application that can be accessed form any device. The aim of this application is to allow me to easily track the weekly and monthly cost on coffee by allowing me to easily input the day and cost of any purchased coffee. 


This application makes use of Continous integration and development by using:
* Unit tests, Integration tests and System tests - All can be run locally with the command "rails test" or "rails test:system"
* Docker for easy transfer of the development environment
* CI/CD with CircleCI - For running tests on the docker container and deploying if everything is successful.
* AWS EC2 instance - A ununtu instance that allows me to host the application


The application can be viewed here: 
http://ec2-54-167-56-234.compute-1.amazonaws.com:3000/coffee_purchases
