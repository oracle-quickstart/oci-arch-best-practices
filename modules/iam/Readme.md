# Identity and Access - Polices and Groups
![version][hoes_iam]

Control the users autentication and authorization process the the tatget for this session. Here some key aspects to consider.
Consider the usage in the technology normaly alredy defined of Identity Provider using Federation over SAML2 and deliver the consistence of user management already defined for the users and grous that will manage the plataform. If your company didnt had oportunity to invest in Identity and Access by Default you can use OCI service to cover this functionality.

# User
Basic and most common principal can eb an users users can be local like the first Administrative user that recomends to keep under control by especifc breack glasss process. Also users can reside on Identity Providers internally in OCI or externaly in cases of Federation over SAMLv2.

# Local Passwords Policy
Once an user exists we need to control the password policy enforced to this user. In federation cases will be handle externally in the Identity provider internally we can use the Local Password Policy to control password attributes.

# Groups
Group is an simple collection of users can be regular - called group or dynamic, based on attributes of user and also services. Here we will explore regular group to used in polices as subject part.

# Polices
OCI has the definition of lest previleve so we need define expilit what permissions we will allow to the subjetcs - groups and services with propper permissions. This is defined using policy syntax. An simple and more intuitve direction:
* Start the planning using what you know, roles. That basically an set of users can perform defined actions against targets.]
* Basic plan will be create the following:
    * Tenancy Administrators - Administrators that will control the entire tenancy. Wide pemissions very controlled small set of users.
    * Tenancy Auditors       - Auditors or Security auditors that will have permissions at least to list and read services tenancy wide.
    * Tenancy Security       - Security teams that will be responsible to validate security controls and services.(Eg.: CloudGuard and polices)
    * Service Admins         - Assigned to compartment level and small set of resources used to build the project like service falily access, compute, virtual network.
    * Service Operators      - Assigned to compartment level and read permission to resources used to build the project like service falily access, compute, virtual network.
## Drivers
Define the permissiosn based on activities that your team nees to perform avoid assign all resources to level one , level two and tree compartmers otherwise this users will have an access too open. In some cases this will be do and desiered but also controlled against conditions that can validate the request and avoid permissions like delele in compartments that has produtivie workloads. 



<!-- Markdown link & dfns -->
[hoes_iam]: https://img.shields.io/badge/hoes_iam-v1.0-brightgreen