# Data Mining Course Project -- New Clustering Algorithm

This is my final project of the data mining course When I studied at Sun Yat-sen University.

Inspired by the famous paper "Clustering by fast search and find of density peaks", I want to design a clustering algorithm that is just based on a simple but efficient idea. By considering the principles revealed by Kmeans and DBSCAN, I believe a good clustering result should contain the following properties:

- For a specific sample p, a sample q which is similar to p should belong to the same class as p. 
- For a specific class, all samples belonging to this class should be as similar as possible to the class center. 

According to the above guidelines, I designed a proper objective function and apply the gradient descending algorithm to obtain category indicators. The results on 3 real-world datasets demonstrate the efficiency of this algorithm.

