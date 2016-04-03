# AlamoFireDemo
An example of AlamoFire + AlamoFireJsonToObjects written in Swift

This is a Swift iOS client for communicating with Luidog's Node-Express-API-Server (https://github.com/Luidog/Node-Express-API-Server) example. They were presented together at a local meetup to provide an overview of how to create a basic RESTful service and have a client communicate with it.

This project relies on cocoapods for the Alamofire and AlamoFireJsonToObjects dependencies. 

# To Deploy

1. Clone the repository to your local system and navigate to the project's location in a terminal.
2. With cocoapods installed, type 'pod install' to download required dependencies.
2. Open the workspace file created by the pod installation process.
3. Edit ActiveServer.swift to point to a running Node-Express-API-Server.
4. Run in the simulator or on your iOS device. 
