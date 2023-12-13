# Coffee Tracking App

As part of this CA I have decided to build a easy to use coffee purchases management application. This application aims to be a personal web application that can be accessed form any device. The aim of this application is to allow me to easily track the weekly and monthly cost on coffee by allowing me to easily input the day and cost of any purchased coffee. 

The necessity for this application emerged during my regular commute to and from college and realizing the direct corelation in between the increase in my regular caffein intake with the increase in assignments as well as decrease of sleep, in addition to planning my budget for Christmas shopping. I Immediately identified the problem and realized that while every little necessary, small transaction like these will prove detrimental not only to my budget but also my health. As such the perfect way to balance this problem is to allow me to input the cost and time immediately after a coffee purchase to allow me to quickly view my exact spending this week and month so that the cumulative amount of purchases discourage me from regularly buying any more coffee and allowing me to stay within the required budget for this Christmas.


This application makes use of Continous integration and development by using:
* Unit tests, Integration tests and System tests - All can be run locally
* Docker for easy transfer of the development environment
* CircleCI - For running tests on the docker container and deploying if everything is successful.
* AWS EC2 instance - A ununtu instance that allows me to host the application


The application can be viewed here: 
http://ec2-54-167-56-234.compute-1.amazonaws.com:3000/coffee_purchases
