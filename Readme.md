# Architecture Center Best practices
![version][hoes]

This code is based on Terraform focus to deliver the principals to guide you to build a strong consistence foundation layer to simplify the deployment and adoption of Oracle Cloud Infrastructure – OCI.
Quick background… was quite common to help costumer asking question on how we start with OCI. This anachronism created – HOES, that can be found in the code.
Now let us start to build the answer for this following the exact same division of code structure by the following terraform modules bellow:
* Identity and access
* Compartments
* Tags
* Security
* Virtual Networking

The objective here is share how to create a foundation layer to be used not only for a single project but be designed to address the common required and be revised in future waves to cover more specific scenarios.

# Quick Overview
## Identity and access
Be capable to control what principals can be able access the service and how they will access the service is managed by Identity and Access. 
Federation can and will be addressed in this section if you do not have any OCI bring to you this service for administrative service.

## Compartments
Logical organization of resources can be also be understood like folders that will help organize cloud resources and polices that will authorize will honor the hierarchic that you design. 

## Tags
Tags can help on provide an orthogonal perpective of the services that you have deployed. However indepdendent of the CSP or even rpoject is one of the most renagated contruct and also one that brings relevant lacks management, cost control troubleshooting and also simplification on how to improve security because can also be evaluated on policy.

## Security
Security in any platform will be pervasive and present in all interactions of service life cycle.
Once the user be able to login authorization takes place to allow what actions this user can perform reinforcing here OCI works with least privilege principal.  Polices address this capability, in this guide we recommend initial police sets to help initially define the governance model.
In this code we also present the possibility to create the security posture using a service called Cloud Guard.
Another relevant aspect covered here is how to manage encryption keys to be used in several OCI services like buckets, block volumes and secrets. Provide the capability to use keys that you can manage.


<!-- Markdown link & dfns -->
[hoes]: https://img.shields.io/badge/hoes-v1.0-brightgreen

