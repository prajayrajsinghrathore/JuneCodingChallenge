# JuneCodingChallenge

## Problem Statement

You are managing a fleet of delivery drones for a logistics company. Each drone has a limited carrying capacity, and you have a list of packages with a specific weight. Your goal is to maximize the utilization of the drone fleet by assigning packages to drones so that the total weight carried by each drone is as close as possible to its maximum carrying capacity without exceeding it.

Given the packages' weights and the drones' maximum carrying capacity, determine the optimal way to distribute the packages among the drones.

## Inputs
max_capacity: An integer representing the maximum carrying capacity of each drone.
package_weights: A list of integers where each integer represents the weight of a package.

## Output
Return a list of lists, where each sublist contains the weights of the packages assigned to a single drone. The goal is to have the total weight of the packages in each sublist as
close to max_capacity without exceeding it.

## Constraints
The number of packages can be up to 10,000.
The weight of each package is a positive integer less than or equal to the maximum capacity of the drone.
